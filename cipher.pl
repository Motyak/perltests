use File::Basename;
use Cwd 'abs_path';
if(!defined($INCLUDE_ONCE))
{
    my $INCLUDE_ONCE_FILENAME = abs_path(dirname(__FILE__)) . '/include_once.pl';
    require $INCLUDE_ONCE_FILENAME;
}

package cipher;

sub do_it
{
    my ($input) = @_;
    # pour les mots de 2 ou 3 lettres, on inverse première et dernière
    $input =~ s/(^| |'|-)(\pL)(\pL?)(\pL)(?=\.|,| |-|'|\?|\!|$)/\1\4\3\2/gm;
    # pour les mots de plus de 4+ lettres, swap deux premières et swap deux dernières
    $input =~ s/(^| |'|-)(\pL)(\pL)(\pL*)(\pL)(\pL)(?=\.|,| |-|'|\?|\!|$)/\1\3\2\4\6\5/gm;
    # on remplace les 'v' par des 'ù'
    $input =~ s/v/\xf9/gm;
    # on remplace les 'u' par des 'v'
    $input =~ s/u/v/gm;
    return $input;
}

1;
