package Net::StackExchange::V2::Filters;

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

	*comments_all = subname(
	   "Net::StackExchange::V2::Filters::",
	   no_params("comments"),
	);
	
    return $self;
}
1; #END of Net::StackExchange::V2::Filters
__END__