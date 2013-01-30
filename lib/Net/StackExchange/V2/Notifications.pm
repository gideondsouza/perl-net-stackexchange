package Net::StackExchange::V2::Notifications;

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

	*notifcations = subname(
	   "Net::StackExchange::V2::Notifcations::notifcations",
	   no_params("notifications", {no_site => 1}),
	);
	*notifcations_unread = subname(
	   "Net::StackExchange::V2::Notifications::notifcations_unread",
	   no_params("notifications/unread",{no_site => 1}),
	);
	
    return $self;
}
1; #END of Net::StackExchange::V2::Notifications
__END__