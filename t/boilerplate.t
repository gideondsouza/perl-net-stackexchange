#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 21;

sub not_in_file_ok {
    my ($filename, %regex) = @_;
    open( my $fh, '<', $filename )
        or die "couldn't open $filename for reading: $!";

    my %violated;

    while (my $line = <$fh>) {
        while (my ($desc, $regex) = each %regex) {
            if ($line =~ $regex) {
                push @{$violated{$desc}||=[]}, $.;
            }
        }
    }

    if (%violated) {
        fail("$filename contains boilerplate text");
        diag "$_ appears on lines @{$violated{$_}}" for keys %violated;
    } else {
        pass("$filename contains no boilerplate text");
    }
}

sub module_boilerplate_ok {
    my ($module) = @_;
    not_in_file_ok($module =>
        'the great new $MODULENAME'   => qr/ - The great new /,
        'boilerplate description'     => qr/Quick summary of what the module/,
        'stub function definition'    => qr/function[12]/,
    );
}

TODO: {
  local $TODO = "Need to replace the boilerplate text";

  not_in_file_ok(README =>
    "The README is used..."       => qr/The README is used/,
    "'version information here'"  => qr/to provide version information/,
  );

  not_in_file_ok(Changes =>
    "placeholder date/time"       => qr(Date/time)
  );

  module_boilerplate_ok('lib/Net/StackExchange.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Common.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Sites.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Errors.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Applications.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/AccessTokens.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Users.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Tags.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/SuggestedEdits.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Search.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Revisions.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Questions.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Privileges.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Posts.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Info.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Comments.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Badges.pm');
  module_boilerplate_ok('lib/Net/StackExchange/V2/Answers.pm');


}

