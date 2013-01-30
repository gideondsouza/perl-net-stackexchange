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

	*filters_create = subname(
	   "Net::StackExchange::V2::Filters::filters_create",
	   no_params("filters/create", {no_site => 1}),
	);
	*filters = subname(
	   "Net::StackExchange::V2::Filters::filters",
	   one_param("filters", "", {no_site => 1}),
	);
	
    return $self;
}
1; #END of Net::StackExchange::V2::Filters
__END__