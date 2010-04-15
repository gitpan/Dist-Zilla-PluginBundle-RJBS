package Dist::Zilla::PluginBundle::RJBS;
BEGIN {
  $Dist::Zilla::PluginBundle::RJBS::VERSION = '0.101040';
}
# ABSTRACT: BeLike::RJBS when you build your dists

use Moose;
use Moose::Autobox;
use Dist::Zilla 2.100922; # TestRelease
with 'Dist::Zilla::Role::PluginBundle::Easy';


use Dist::Zilla::PluginBundle::Basic;
use Dist::Zilla::PluginBundle::Git;

has manual_version => (
  is      => 'ro',
  isa     => 'Bool',
  lazy    => 1,
  default => sub { $_[0]->payload->{manual_version} },
);

has major_version => (
  is      => 'ro',
  isa     => 'Int',
  lazy    => 1,
  default => sub { $_[0]->payload->{version} || 0 },
);

has is_task => (
  is      => 'ro',
  isa     => 'Bool',
  lazy    => 1,
  default => sub { $_[0]->payload->{is_task} },
);

sub configure {
  my ($self) = @_;

  $self->add_bundle('@Basic');

  my $v_format = $self->is_task
    ? q<{{ cldr('yyyyMMdd') }}.> . sprintf('%03u', ($ENV{N} || 0))
    : q<{{ $major }}.{{ cldr('yyDDD') }}> . sprintf('%01u', ($ENV{N} || 0));

  # XXX: This can go away now that we have --trial, right? -- rjbs, 2010-04-13
  $v_format .= ($ENV{DEV} ? (sprintf '_%03u', $ENV{DEV}) : '');

  $self->add_plugins('AutoPrereq');

  unless ($self->manual_version) {
    $self->add_plugins([
      AutoVersion => {
        major     => $self->major_version,
        format    => $v_format,
        time_zone => 'America/New_York',
      }
    ]);
  }

  $self->add_plugins(qw(
    PkgVersion
    MetaConfig
    MetaJSON
    NextRelease
    PodSyntaxTests
    Repository
  ));

  $self->is_task
    ? $self->add_plugins('TaskWeaver')
    : $self->add_plugins([ PodWeaver => { config_plugin => '@RJBS' } ]);

  $self->add_bundle('@Git' => { tag_format => '%v' });
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;

__END__
=pod

=head1 NAME

Dist::Zilla::PluginBundle::RJBS - BeLike::RJBS when you build your dists

=head1 VERSION

version 0.101040

=head1 DESCRIPTION

This is the plugin bundle that RJBS uses.  It is equivalent to:

  [@Basic]

  [AutoPrereq]
  [AutoVersion]
  [PkgVersion]
  [MetaConfig]
  [MetaJSON]
  [NextRelease]
  [PodSyntaxTests]

  [PodWeaver]
  config_plugin = @RJBS

  [Repository]

  [@Git]
  tag_format = %v

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

