
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Dist-Zilla-PluginBundle-RJBS',
  NAME      => 'Dist::Zilla::PluginBundle::RJBS',
  AUTHOR    => 'Ricardo\ SIGNES\ \<rjbs\@cpan\.org\>',
  ABSTRACT  => 'BeLike\:\:RJBS\ when\ you\ build\ your\ dists',
  VERSION   => '0.091560',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Dist::Zilla::Plugin::PodPurler" => '0',
    "Dist::Zilla" => '1.091370',
    "Dist::Zilla::Plugin::Repository" => '0',
  },
);
