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

sub main
{
    my @input;
    while (<STDIN>)
    {
        push @input, $_;
    }
    my $joined_input = join('', @input);
    print(cipher::do_it($joined_input));
}

my $STDIN_ENDING_TOKEN = "cestleclate\n";
sub main_alt
{
    my @input;
    while (<STDIN>)
    {
        last if $_ eq $STDIN_ENDING_TOKEN;
        push @input, $_;
    }
    my $joined_input = join('', @input);
    print(cipher::do_it($joined_input));
}

# version pour serveur
if(@ARGV)
{
    while(1)
    {
        main_alt();
    }
}

# version simple
main();
