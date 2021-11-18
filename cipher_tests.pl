#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename;
use Cwd "abs_path";

my $CIPHER_FILENAME = abs_path(dirname(__FILE__)) . "/cipher.pl";
require $CIPHER_FILENAME;

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

sub file_to_str
{
    my ($filename) = @_;
    open my $fh, '<', $filename or die "Can't open file $!";
    read $fh, my $str, -s $fh;
    return $str;
}

package cipher_tests;

my $FUNCTION_TO_TEST = \&cipher::do_it;

sub corpus1
{
    my $input = tests::file_to_str('corpus1.txt');
    my $expecting = tests::file_to_str('corpus1_out.txt');
    my $output = $FUNCTION_TO_TEST->($input);

    if(!tests::are_equals($output, $expecting))
    {
        warn "'corpus1' failed \n\n input='" . $input 
                . "' \n\n expecting='" . $expecting
                . "' \n\n output='" . $output . "'\n";
        return 0;
    }
    return 1;
}

1;
