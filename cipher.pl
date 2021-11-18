package cipher;

sub do_it
{
    my ($input) = @_;
    print($input);
    print("\n\n");
    $input =~ s/(^| |'|-)(\pL)(\pL?)(\pL)(?=\.|,| |-)/\1\4\3\2/gm;
    print($input);
    print("\n\n");
    $input =~ s/(^| |'|-)(\pL)(\pL)(\pL*)(\pL)(\pL)(?=\.|,| |-)/\1\3\2\4\6\5/gm;
    print($input);
    print("\n\n");
    # return $input;
}

# 1;

open my $fh, '<', 'corpus1.txt' or die "Can't open file $!";
read $fh, my $str, -s $fh;

do_it($str);

# print(do_it($str));
