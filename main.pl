#!/usr/bin/env perl

use File::Basename;
use Cwd 'abs_path';
if(!defined($INCLUDE_ONCE))
{
    my $INCLUDE_ONCE_FILENAME = abs_path(dirname(__FILE__)) . '/include_once.pl';
    require $INCLUDE_ONCE_FILENAME;
}

my $CIPHER_FILENAME = abs_path(dirname(__FILE__)) . '/cipher.pl';
require $CIPHER_FILENAME;


my @input;
while (<STDIN>)
{
    push @input, $_;
}
my $joined_input = join('', @input);
print(cipher::do_it($joined_input));
