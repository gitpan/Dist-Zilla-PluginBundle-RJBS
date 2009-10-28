use strict;
use warnings;
package Dist::Zilla::App::Command::rjbsver;
our $VERSION = '0.093000';


# ABSTRACT: see what the mantissa for an rjbs-style version is today
use Dist::Zilla::App -command;

use DateTime ();

sub command_names { qw(rjbsver rjv) }

sub run {
  my $now = DateTime->now(time_zone => 'America/New_York');

  printf "Current version mantissa, assuming N=0, is %s0\n",
    $now->format_cldr('yyDDD');
}

1;

__END__
=pod

=head1 NAME

Dist::Zilla::App::Command::rjbsver - see what the mantissa for an rjbs-style version is today

=head1 VERSION

version 0.093000

=head1 AUTHOR

  Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

