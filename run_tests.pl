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
    open my $fh, '<:encoding(UTF-8)', $filename or die "Can't open file $!";
    read $fh, my $str, -s $fh;
    return $str;
}

package cipher_tests;

my $FUNCTION_TO_TEST = \&cipher::do_it;

sub corpus
{
    # récupérer tous les noms de fichiers à tester dans le répertoire corpus #
    opendir my $dir, './corpus/' or die "Cannot open directory: $!";
    my @corpus = grep{/\.*(?<!_out)\.txt/g} readdir $dir;
    closedir $dir;

    # faire les tests #
    foreach(@corpus)
    {
        $_ =~ s/(\.*).txt/\1/g;
        
        my $input = tests::file_to_str('./corpus/' . $_ . '.txt');
        my $expecting = tests::file_to_str('./corpus/' . $_ . '_out.txt');
        my $output = $FUNCTION_TO_TEST->($input);

        if(!tests::are_equals($output, $expecting))
        {
            warn "'$_' failed \n\n input='" . $input 
                    . "' \n\n expecting='" . $expecting
                    . "' \n\n output='" . $output . "'\n";
            return 0;
        }
    }
    return 1;
}

cipher_tests::corpus();
