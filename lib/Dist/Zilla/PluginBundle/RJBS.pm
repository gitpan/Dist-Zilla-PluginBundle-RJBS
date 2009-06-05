package Dist::Zilla::PluginBundle::RJBS;
our $VERSION = '0.091560';

# ABSTRACT: BeLike::RJBS when you build your dists

use Moose;
use Moose::Autobox;
with 'Dist::Zilla::Role::PluginBundle';


use Dist::Zilla::PluginBundle::Filter;

sub bundle_config {
  my ($self, $arg) = @_;
  my $class = (ref $self) || $self;

  my $major_version = defined $arg->{version} ? $arg->{version} : 0;
  my $format        = q<{{ $major }}.{{ cldr('yyDDD') }}>
                    . sprintf('%01u', ($ENV{N} || 0))
                    . ($ENV{DEV} ? (sprintf '_%03u', $ENV{DEV}) : '') ;

  my @plugins = Dist::Zilla::PluginBundle::Filter->bundle_config({
    bundle => '@Classic',
    remove => [ qw(PodVersion MetaYAML MetaYaml) ],
  });

  push @plugins, (
    [ 'Dist::Zilla::Plugin::AutoVersion' =>
      { major => $major_version, format => $format } ],
    [ 'Dist::Zilla::Plugin::MetaJSON'    => {      } ],
    [ 'Dist::Zilla::Plugin::NextRelease' => {      } ],
    [ 'Dist::Zilla::Plugin::PodPurler'   => {      } ],
    [ 'Dist::Zilla::Plugin::Repository'  => {      } ],
  );

  eval "require $_->[0]" or die for @plugins; ## no critic Carp

  @plugins->map(sub { $_->[1]{'=name'} = "$class/$_->[0]" });

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

version 0.091560

=head1 DESCRIPTION

This is the plugin bundle that RJBS uses.  It is equivalent to:

  [@Filter]
  bundle = @Classic
  remove = PodVersion
  remove = MetaYAML

  [AutoVersion]
  [MetaJSON]
  [NextRelease]
  [PodPurler]
  [Repository]

=head1 AUTHOR

  Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


