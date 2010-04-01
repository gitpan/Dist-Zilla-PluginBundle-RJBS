package Dist::Zilla::PluginBundle::RJBS;
$Dist::Zilla::PluginBundle::RJBS::VERSION = '0.100910';
# ABSTRACT: BeLike::RJBS when you build your dists

use Moose;
use Moose::Autobox;
use Dist::Zilla 2;
with 'Dist::Zilla::Role::PluginBundle';


use Dist::Zilla::PluginBundle::Filter;
use Dist::Zilla::PluginBundle::Git;

sub bundle_config {
  my ($self, $section) = @_;
  my $class = (ref $self) || $self;

  my $arg = $section->{payload};
  my $is_task = $arg->{task};

  my @plugins = Dist::Zilla::PluginBundle::Filter->bundle_config({
    name    => $section->{name} . '/@Classic',
    payload => {
      bundle => '@Classic',
      remove => [ qw(PodVersion PodCoverageTests) ],
    },
  });

  my $version_format;
  my $major_version = 0;

  if ($is_task) {
    $version_format = q<{{ cldr('yyyyMMdd') }}.>
                    . sprintf('%03u', ($ENV{N} || 0))
                    . ($ENV{DEV} ? (sprintf '_%03u', $ENV{DEV}) : '') ;
  } else {
    $major_version  = defined $arg->{version} ? $arg->{version} : 0;
    $version_format = q<{{ $major }}.{{ cldr('yyDDD') }}>
                    . sprintf('%01u', ($ENV{N} || 0))
                    . ($ENV{DEV} ? (sprintf '_%03u', $ENV{DEV}) : '') ;
  }

  my $prefix = 'Dist::Zilla::Plugin::';
  my @extra = map {[ "$section->{name}/$_->[0]" => "$prefix$_->[0]" => $_->[1] ]}
  (
    [ AutoPrereq  => {} ],
    ($arg->{manual_version} ? () :
      [
        AutoVersion => {
          major     => $major_version,
          format    => $version_format,
          time_zone => 'America/New_York',
        }
      ]
    ),
    [ MetaConfig   => { } ],
    [ MetaJSON     => { } ],
    [ NextRelease  => { } ],
    [ ($is_task ? 'TaskWeaver' : 'PodWeaver') => { config_plugin => '@RJBS' } ],
    [ Repository   => { } ],
  );

  push @plugins, @extra;

  push @plugins, Dist::Zilla::PluginBundle::Git->bundle_config({
    name    => "$section->{name}/\@Git",
    payload => {
      tag_format => '%v',
    },
  });

  return @plugins;
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;

__END__
=pod

=head1 NAME

Dist::Zilla::PluginBundle::RJBS - BeLike::RJBS when you build your dists

=head1 VERSION

version 0.100910

=head1 DESCRIPTION

This is the plugin bundle that RJBS uses.  It is equivalent to:

  [@Filter]
  bundle = @Classic
  remove = PodVersion
  remove = PodCoverageTests

  [AutoPrereq]
  [AutoVersion]
  [MetaConfig]
  [MetaJSON]
  [NextRelease]
  [PodWeaver]
  [Repository]

If the C<task> argument is given to the bundle, PodWeaver is replaced with
TaskWeaver.  If the C<manual_version> argument is given, AutoVersion is
omitted.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

