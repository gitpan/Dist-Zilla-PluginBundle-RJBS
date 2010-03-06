
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::PluginBundle::RJBS',
                       'DISTNAME' => 'Dist-Zilla-PluginBundle-RJBS',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Ricardo Signes <rjbs@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'BeLike::RJBS when you build your dists',
                       'EXE_FILES' => [],
                       'VERSION' => '0.100650',
                       'PREREQ_PM' => {
                                        'DateTime' => '0',
                                        'Dist::Zilla::Plugin::PodWeaver' => '3.092971',
                                        'Pod::Elemental' => '0.092970',
                                        'Dist::Zilla::Role::PluginBundle' => '0',
                                        'Dist::Zilla::PluginBundle::Filter' => '0',
                                        'Pod::Weaver' => '3.100310',
                                        'Moose' => '0',
                                        'Dist::Zilla::App' => '0',
                                        'Pod::Elemental::Transformer::List' => '0',
                                        'Dist::Zilla::Plugin::AutoPrereq' => '1.100130',
                                        'Dist::Zilla::Plugin::Repository' => '0',
                                        'Moose::Autobox' => '0',
                                        'Test::More' => '0',
                                        'Dist::Zilla' => '1.092990',
                                        'Dist::Zilla::PluginBundle::Git' => '0',
                                        'Dist::Zilla::Plugin::TaskWeaver' => '0.093330'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



