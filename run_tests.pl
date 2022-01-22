#!/usr/bin/env perl

use File::Basename;
use Cwd 'abs_path';
if(!defined($INCLUDE_ONCE))
{
    my $INCLUDE_ONCE_FILENAME = abs_path(dirname(__FILE__)) . '/include_once.pl';
    require $INCLUDE_ONCE_FILENAME;
}

my $CIPHER_TESTS_FILENAME = abs_path(dirname(__FILE__)) . '/cipher_tests.pl';
require $CIPHER_TESTS_FILENAME;

cipher_tests::corpus1();
cipher_tests::echobonjour();
cipher_tests::multiplelines();
cipher_tests::multiplelines2();
