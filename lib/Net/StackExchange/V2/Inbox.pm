package Net::StackExchange::V2::Inbox;

use 5.006;
use strict;
use warnings FATAL => 'all';
use Sub::Name qw(subname);
use Net::StackExchange::V2::Common qw(query no_params one_param);

our $VERSION = '0.01';

sub new {
	my ($class, $params) = @_;
    my $self = $params;
    bless $self, $class;

	*inbox = subname(
	   "Net::StackExchange::V2::Inbox::inbox",
	   no_params("inbox", {no_site => 1}),
	);
	*inbox_unread = subname(
	   "Net::StackExchange::V2::Inbox::inbox_unread",
	   no_params("inbox/unread",{no_site => 1}),
	);
		
    return $self;
}
1; #END of Net::StackExchange::V2::Inbox
__END__