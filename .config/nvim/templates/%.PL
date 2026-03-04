#!/usr/bin/env perl
if ( defined $GITHUB_REF_NAME ) {
    $VERSION = $GITHUB_REF_NAME;
}
else {
    $VERSION = `git describe --abbrev=0`;
    chomp $VERSION;
}
$VERSION = '0.0.0' if $VERSION eq '';
my $filename = shift;
exit unless $filename;
open my $out, ">$filename" or die "Can't create `$filename'!";
chmod 0755, $filename;

my $code = <<EOF;
#!/usr/bin/env perl
\$VERSION = '$VERSION';
use strict;
use warnings;
EOF

use strict;
use warnings;

$code .= <<'EOF';
my $MAIN = $0;
$MAIN =~ s=.*/==;
use Getopt::Long;
Getopt::Long::config(qw(auto_help auto_version));

sub main() {
    my $print_completion;
    GetOptions(
        'print-completion=s' => \$print_completion,
    );
    if ($print_completion) {
        if ($print_completion eq 'zsh') {
          print_completion_zsh();
        }
        else {
          warn "No completion support for `$print_completion'";
          exit 1;
        }
        exit 0;
    }
}
EOF

open my $in, '<' . <*.pod> or die "Can't find `*.pod'!";
my @lines = ();
my @pods  = ();
my $sep   = $/;
$/ = '=item B<-';
while (<$in>) {
    push @pods, $_;

    # strip \..*
    s/^([^.]*)\..*/$1/s;

    # remove pod mark B<>, I<>
    s/^/B<-/;
    s/B<(-(?:.|-[^>]+))>/$1/g;
    s/I<([^>]*)>/$1/g;

    # convert '-?, --help' to '{-?,--help}'
    s/, -/,-/g;
    s!(-[^= ]+,[^=$sep]+)(=|$sep)!{$1}$2!;

    # convert '--option=value XXXX' to '--option"[XXX]:value"'
    s/=([^$sep]+)$sep$sep(.*)/"[$2]:$1"/s;

    # convert '--option XXXX' to '--option"[XXX]"'
    s/$sep$sep(.*)/"[$1]"/s;

    # change `--help` to `'(- : *)'--help`
    s/(.*and exit)/'(- : *)'$1/;
    s/(:shell)/$1:(zsh)/;
    push @lines, $_;
}
$/ = $sep;

# not $\, zsh only support '\n'
my $options = join "\n  ", @lines[ 1 .. $#lines ];

$code .= <<EOF;
sub print_completion_zsh() {
    print <<_EOF;
#compdef \$MAIN
local options=(
  $options
)
_arguments -S -s \\\$options '*:: :_files'
_EOF
}

main
__END__
EOF

$code .= join '', @pods;

print $out $code;
