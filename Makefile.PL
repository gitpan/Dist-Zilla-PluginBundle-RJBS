
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Dist-Zilla-PluginBundle-RJBS',
  NAME      => 'Dist::Zilla::PluginBundle::RJBS',
  AUTHOR    => 'Ricardo\ SIGNES\ \<rjbs\@cpan\.org\>',
  ABSTRACT  => 'BeLike\:\:RJBS\ when\ you\ build\ your\ dists',
  VERSION   => '0.092830',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Dist::Zilla::Plugin::PodPurler" => '0',
    "Dist::Zilla" => '1.092360',
    "Dist::Zilla::Plugin::Repository" => '0',
  },
  test => {TESTS => 't/*.t'}
);

