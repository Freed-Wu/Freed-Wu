package {{ substitute(substitute(expand('%:r'), '\%(/\|^\)\(.\)', '::\u\1', 'g'), '^::Lib::', '', 'g') }}
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw();

1;

__END__

=head1 NAME

{{ substitute(substitute(expand('%:r'), '\%(/\|^\)\(.\)', '::\u\1', 'g'), '^::Lib::', '', 'g') }} - {% here %}

=head1 DESCRIPTION
