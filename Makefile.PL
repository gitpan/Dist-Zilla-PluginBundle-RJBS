
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::PluginBundle::RJBS',
                       'DISTNAME' => 'Dist-Zilla-PluginBundle-RJBS',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Ricardo Signes <rjbs@cpan.org>',
                       'BUILD_REQUIRES' => {
                                             'Test::More' => '0'
                                           },
                       'ABSTRACT' => 'BeLike::RJBS when you build your dists',
                       'EXE_FILES' => [],
                       'VERSION' => '0.101020',
                       'PREREQ_PM' => {
                                        'DateTime' => '0',
                                        'Dist::Zilla::Plugin::PodWeaver' => '3.092971',
                                        'Dist::Zilla::App' => '0',
                                        'Pod::Elemental' => '0.092970',
                                        'Pod::Elemental::Transformer::List' => '0',
                                        'Dist::Zilla::Role::PluginBundle' => '0',
                                        'Dist::Zilla::Plugin::AutoPrereq' => '1.100130',
                                        'Dist::Zilla::Plugin::Repository' => '0',
                                        'Moose::Autobox' => '0',
                                        'Dist::Zilla' => '2.100922',
                                        'Pod::Weaver' => '3.100310',
                                        'Dist::Zilla::PluginBundle::Git' => '0',
                                        'Dist::Zilla::Plugin::TaskWeaver' => '0.093330',
                                        'Dist::Zilla::PluginBundle::Basic' => '0',
                                        'Moose' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



