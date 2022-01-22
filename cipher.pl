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
    $input =~ s/(^| |'|-)(\pL)(\pL?)(\pL)(?=\.|,| |-|'|\?|\!|$)/\1\4\3\2/gm;
    $input =~ s/(^| |'|-)(\pL)(\pL)(\pL*)(\pL)(\pL)(?=\.|,| |-|'|\?|\!|$)/\1\3\2\4\6\5/gm;
    return $input;
}

1;
