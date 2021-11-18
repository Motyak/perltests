#!/usr/bin/env perl

use strict;
use warnings;

require "/home/nas-wks01/users/uapv1903668/test/cipher/cipher.pl";

package tests;

sub are_equals
{
    my ($a, $b) = @_;
    if($a ne $b)
    {
        return 0;
    }
    return 1;
}

package cipher_tests;

sub no_letter_word
{
    my $input = "";
    my $expecting = "";
    my $output = cipher::do_it($input);

    if(!tests::are_equals($output, $expecting))
    {
        warn "'no_letter_word' failed, input='" . $input 
                . "', expecting='" . $expecting
                . "', output='" . $output . "'\n";
        return 0;
    }
    return 1;
}

1;
