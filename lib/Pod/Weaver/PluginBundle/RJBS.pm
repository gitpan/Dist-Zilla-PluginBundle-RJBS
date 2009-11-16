use strict;
use warnings;
package Pod::Weaver::PluginBundle::RJBS;
our $VERSION = '0.093200';


# ABSTRACT: RJBS's default Pod::Weaver config


sub mvp_bundle_config {
  return (
    [ '@RJBS/Default', 'Pod::Weaver::PluginBundle::Default', {} ],
    [ '@RJBS/WikiDoc', 'Pod::Weaver::Plugin::WikiDoc',       {} ],
  );
}

1;

__END__
=pod

=head1 NAME

Pod::Weaver::PluginBundle::RJBS - RJBS's default Pod::Weaver config

=head1 VERSION

version 0.093200

=head1 OVERVIEW

Equivalent to:

=over

=item *

@Default

=item *

-WikiDoc

=back

=head1 AUTHOR

  Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

