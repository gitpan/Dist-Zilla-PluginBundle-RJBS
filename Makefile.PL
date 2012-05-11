
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "BeLike::RJBS when you build your dists",
  "AUTHOR" => "Ricardo Signes <rjbs\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Test::More" => "0.96"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-PluginBundle-RJBS",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Zilla::PluginBundle::RJBS",
  "PREREQ_PM" => {
    "Dist::Zilla" => "2.100922",
    "Dist::Zilla::Plugin::AutoPrereq" => "1.100130",
    "Dist::Zilla::Plugin::CheckExtraTests" => 0,
    "Dist::Zilla::Plugin::CheckPrereqsIndexed" => 0,
    "Dist::Zilla::Plugin::GithubMeta" => "0.12",
    "Dist::Zilla::Plugin::PodWeaver" => "3.092971",
    "Dist::Zilla::Plugin::TaskWeaver" => "0.093330",
    "Dist::Zilla::PluginBundle::Basic" => 0,
    "Dist::Zilla::PluginBundle::Filter" => 0,
    "Dist::Zilla::PluginBundle::Git" => 0,
    "Dist::Zilla::Role::PluginBundle::Easy" => 0,
    "Moose" => 0,
    "Moose::Autobox" => 0,
    "Pod::Elemental" => "0.092970",
    "Pod::Elemental::Transformer::List" => 0,
    "Pod::Weaver" => "3.100310",
    "Pod::Weaver::Config::Assembler" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.011",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



