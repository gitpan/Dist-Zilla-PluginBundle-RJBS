use strict;
use warnings;
use Test::More 0.88;
# This is a relatively nice way to avoid Test::NoWarnings breaking our
# expectations by adding extra tests, without using no_plan.  It also helps
# avoid any other test module that feels introducing random tests, or even
# test plans, is a nice idea.
our $success = 0;
END { $success && done_testing; }

# List our own version used to generate this
my $v = "\nGenerated by Dist::Zilla::Plugin::ReportVersions::Tiny v1.09\n";

eval {                     # no excuses!
    # report our Perl details
    my $want = "any version";
    $v .= "perl: $] (wanted $want) on $^O from $^X\n\n";
};
defined($@) and diag("$@");

# Now, our module version dependencies:
sub pmver {
    my ($module, $wanted) = @_;
    $wanted = " (want $wanted)";
    my $pmver;
    eval "require $module;";
    if ($@) {
        if ($@ =~ m/Can't locate .* in \@INC/) {
            $pmver = 'module not found.';
        } else {
            diag("${module}: $@");
            $pmver = 'died during require.';
        }
    } else {
        my $version;
        eval { $version = $module->VERSION; };
        if ($@) {
            diag("${module}: $@");
            $pmver = 'died during VERSION check.';
        } elsif (defined $version) {
            $pmver = "$version";
        } else {
            $pmver = '<undef>';
        }
    }

    # So, we should be good, right?
    return sprintf('%-45s => %-10s%-15s%s', $module, $pmver, $wanted, "\n");
}

eval { $v .= pmver('Dist::Zilla','4.300036') };
eval { $v .= pmver('Dist::Zilla::Plugin::AutoPrereq','1.100130') };
eval { $v .= pmver('Dist::Zilla::Plugin::CheckExtraTests','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::CheckPrereqsIndexed','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::GithubMeta','0.12') };
eval { $v .= pmver('Dist::Zilla::Plugin::PodWeaver','3.092971') };
eval { $v .= pmver('Dist::Zilla::Plugin::ReportVersions::Tiny','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::TaskWeaver','0.093330') };
eval { $v .= pmver('Dist::Zilla::Plugin::Test::ChangesHasContent','any version') };
eval { $v .= pmver('Dist::Zilla::Plugin::Test::Compile','any version') };
eval { $v .= pmver('Dist::Zilla::PluginBundle::Basic','any version') };
eval { $v .= pmver('Dist::Zilla::PluginBundle::Filter','any version') };
eval { $v .= pmver('Dist::Zilla::PluginBundle::Git','any version') };
eval { $v .= pmver('Dist::Zilla::Role::PluginBundle::Easy','any version') };
eval { $v .= pmver('ExtUtils::MakeMaker','6.30') };
eval { $v .= pmver('File::Spec','any version') };
eval { $v .= pmver('IO::Handle','any version') };
eval { $v .= pmver('IPC::Open3','any version') };
eval { $v .= pmver('Moose','any version') };
eval { $v .= pmver('Moose::Autobox','any version') };
eval { $v .= pmver('Pod::Elemental','0.092970') };
eval { $v .= pmver('Pod::Elemental::Transformer::List','any version') };
eval { $v .= pmver('Pod::Weaver','3.100310') };
eval { $v .= pmver('Pod::Weaver::Config::Assembler','any version') };
eval { $v .= pmver('Test::More','0.96') };
eval { $v .= pmver('Test::Pod','1.41') };
eval { $v .= pmver('strict','any version') };
eval { $v .= pmver('version','0.9901') };
eval { $v .= pmver('warnings','any version') };


# All done.
$v .= <<'EOT';

Thanks for using my code.  I hope it works for you.
If not, please try and include this output in the bug report.
That will help me reproduce the issue and solve your problem.

EOT

diag($v);
ok(1, "we really didn't test anything, just reporting data");
$success = 1;

# Work around another nasty module on CPAN. :/
no warnings 'once';
$Template::Test::NO_FLUSH = 1;
exit 0;
