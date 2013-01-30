package Net::StackExchange::V2::Events;

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

	*events = subname(
	   "Net::StackExchange::V2::Events::events",
	   no_params("events"),
	);
	
    return $self;
}
1; #END of Net::StackExchange::V2::Events
__END__