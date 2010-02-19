use strict;
use warnings;
package Pod::Weaver::PluginBundle::RJBS;
our $VERSION = '0.100500';
# ABSTRACT: RJBS's default Pod::Weaver config


sub mvp_bundle_config {
  return (
    [ '@RJBS/Default', 'Pod::Weaver::PluginBundle::Default', {} ],
    [ '@RJBS/List',    'Pod::Weaver::Plugin::Transformer',
      { 'transformer' => 'List' }
    ],
  );
}

1;

__END__
=pod

=head1 NAME

Pod::Weaver::PluginBundle::RJBS - RJBS's default Pod::Weaver config

=head1 VERSION

version 0.100500

=head1 OVERVIEW

Equivalent to:

=over 4

=item *

C<@Default>

=item *

C<-Transformer> with L<Pod::Elemental::Transformer::List>

=back

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

