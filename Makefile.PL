
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Dist-Zilla-PluginBundle-RJBS',
  NAME      => 'Dist::Zilla::PluginBundle::RJBS',
  AUTHOR    => "Ricardo\ SIGNES\ \<rjbs\@cpan\.org\>",
  ABSTRACT  => "BeLike\:\:RJBS\ when\ you\ build\ your\ dists",
  VERSION   => '0.093000',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Dist::Zilla::Plugin::PodWeaver" => '3.092971',
    "Pod::Elemental::Transformer::WikiDoc" => '0.093001',
    "Pod::Elemental" => '0.092970',
    "Dist::Zilla" => '1.092990',
    "Dist::Zilla::Plugin::Repository" => '0',
    "Pod::Weaver" => '3.093001',
  },
  test => {TESTS => 't/*.t'}
);

