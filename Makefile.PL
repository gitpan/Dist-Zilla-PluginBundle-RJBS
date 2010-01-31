
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::PluginBundle::RJBS',
                       'DISTNAME' => 'Dist-Zilla-PluginBundle-RJBS',
                       'AUTHOR' => 'Ricardo Signes <rjbs@cpan.org>',
                       'ABSTRACT' => 'BeLike::RJBS when you build your dists',
                       'EXE_FILES' => [],
                       'VERSION' => '0.100310',
                       'LICENSE' => 'perl',
                       'PREREQ_PM' => {
                                        'Dist::Zilla::Plugin::PodWeaver' => '3.092971',
                                        'Pod::Elemental::Transformer::List' => '0',
                                        'Pod::Elemental' => '0.092970',
                                        'Dist::Zilla::Plugin::AutoPrereq' => '1.100130',
                                        'ExtUtils::MakeMaker' => '6.11',
                                        'Dist::Zilla' => '1.092990',
                                        'Dist::Zilla::Plugin::Repository' => '0',
                                        'Pod::Weaver' => '3.100310',
                                        'Dist::Zilla::Plugin::TaskWeaver' => '0.093330'
                                      }
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



