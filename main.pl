#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';

my $CIPHER_FILENAME = abs_path(dirname(__FILE__)) . '/cipher.pl';
require $CIPHER_FILENAME;

sub main
{
    my $input = join('', <STDIN>);
    print(cipher::do_it($input));
}

# version pour serveur
if(@ARGV)
{
    while(1)
    {
        main();
    }
}

# version simple
main();
