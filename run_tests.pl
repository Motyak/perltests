#!/usr/bin/env perl

use File::Basename;
use Cwd "abs_path";

my $CIPHER_TESTS_FILENAME = abs_path(dirname(__FILE__)) . "/cipher_tests.pl";
require $CIPHER_TESTS_FILENAME;

cipher_tests::corpus1();
