package Dist::Zilla::PluginBundle::RJBS;
our $VERSION = '0.100310';
# ABSTRACT: BeLike::RJBS when you build your dists

use Moose;
use Moose::Autobox;
with 'Dist::Zilla::Role::PluginBundle';


use Dist::Zilla::PluginBundle::Filter;

sub bundle_config {
  my ($self, $section) = @_;
  my $class = (ref $self) || $self;

  my $arg = $section->{payload};
  my $is_task = $arg->{task};

  my @plugins = Dist::Zilla::PluginBundle::Filter->bundle_config({
    name    => "$class/Classic",
    payload => {
      bundle => '@Classic',
      remove => [ qw(PodVersion) ],
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
  my @extra = map {[ "$class/$prefix$_->[0]" => "$prefix$_->[0]" => $_->[1] ]}
  (
    [ AutoPrereq  => {} ],
    [
      AutoVersion => {
        major     => $major_version,
        format    => $version_format,
        time_zone => 'America/New_York',
      }
    ],
    [ MetaJSON     => { } ],
    [ NextRelease  => { } ],
    [ ($is_task ? 'TaskWeaver' : 'PodWeaver') => { config_plugin => '@RJBS' } ],
    [ Repository   => { } ],
  );

  push @plugins, @extra;

  eval "require $_->[1]" or die for @plugins; ## no critic Carp

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

version 0.100310

=head1 DESCRIPTION

This is the plugin bundle that RJBS uses.  It is equivalent to:

  [@Filter]
  bundle = @Classic
  remove = PodVersion

  [AutoVersion]
  [MetaJSON]
  [NextRelease]
  [PodWeaver]
  [Repository]

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

