package Net::StackExchange::V2::Common;

use 5.006;
use strict;
use Data::Dumper;
use JSON qw(decode_json);
use Carp;
use LWP::UserAgent;
use warnings FATAL => 'all';
use constant BASE_URL => "https://api.stackexchange.com/";
our @ISA = qw(Exporter);
our @EXPORT = qw(query no_params one_param two_params);


our $VERSION = '0.01';

sub query {
	my $queryStrHash = pop @_;
#	print Dumper(@_);
	my $url = join("/",@_);
	my @params = ();
	while ( my ($key, $value) = each(%$queryStrHash) ) {
		push @params, $key."=".$value;
    }
	my $query = '?'.join '&',@params;
	my $finalUrl = BASE_URL.$url.$query;
	print $finalUrl;
	my $ua = LWP::UserAgent->new;
	my $response = $ua->get($finalUrl);
	return	decode_json($response->decoded_content);
	#StackExchange already returns error codes for 
	#incorrect params and requests 
	
	# if ($response->is_success) {
	# 	return	decode_json($response->decoded_content); 
	# }
	# else {
	# 	croak $response->status_line;
	# }
}
sub no_params {
	my $param = shift;
	return sub {
		my $self = shift;
		my $queryStr = pop @_;
		if(not $self->{site} eq '') {
			 $queryStr->{site} = $self->{site};
		}
		return query($param, $queryStr);
	}
}

sub one_param {
	my $param1 = shift;
	my $param2 = shift;
	my $config = shift;
	return sub {
		my $self = shift;
		my $ids = shift;
		#you should check if this param is NOT null/empty
		my $q = shift;
		
		if(defined($q)) {
		# copy current method keys and vals
			while(my($key,$val) = each(%$q))
			{
				$self->{$key} = $val;
			}
		}
		my $ids_str = "";
		if (ref($ids) eq 'ARRAY') {
			 $ids_str = join(";",@$ids);
		} else {
			$ids_str = $ids."";
		}
#		print Dumper($q);
		if (defined($config) and $config->{no_site} == 1) {
			$self->{site} = '';
		}
		if (not defined($param2)) {
			return query($param1, $ids_str , $self);
		} else {
			return query($param1, $ids_str, $param2, $self);
		}
	}
}
sub two_params {
	my $param1 = shift;
	my $param2 = shift;
	my $param3 = shift;
	return sub {
		my $self = shift;
		my $ids = shift;
		my $ids_2 = shift;
		my $q = shift;
		
		if(defined($q)) {
		# copy current method keys and vals
			while(my($key,$val) = each(%$q))
			{
				$self->{$key} = $val;
			}
		}
		my $ids_str = "";
		if (ref($ids) eq 'ARRAY') {
			 $ids_str = join(";",@$ids);
		} else {
			$ids_str = $ids."";
		}
		my $ids_str_2 = "";
		if (ref($ids_2) eq 'ARRAY') {
			 $ids_str_2 = join(";",@$ids_2);
		} else {
			$ids_str_2 = $ids_2."";
		}
#		print Dumper($q);
		# if (defined($config) and $config->{no_site} == 1) {
		# 	$self->{site} = '';
		# }
		if (not defined($param3)) {
			return query($param1, $ids_str, $param2, $ids_str_2, $self);
		} else {
			return query($param1, $ids_str, $param2, $ids_str_2, $param3, $self);
		}
	}
}
1; # End of Net::StackExchange::V2::Common
__END__
=head1 NAME

Net::StackExchange::V2::Common - The great new Net::StackExchange::V2::Common!

=head1 VERSION

Version 0.01

=cut



=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Net::StackExchange::V2::Common;

    my $foo = Net::StackExchange::V2::Common->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

=head2 function2

=cut

=head1 AUTHOR

Gideon Israel Dsouza, C<< <gideon at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-net-stackexchange at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-StackExchange>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::StackExchange::V2::Common


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-StackExchange>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Net-StackExchange>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Net-StackExchange>

=item * Search CPAN

L<http://search.cpan.org/dist/Net-StackExchange/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Gideon Israel Dsouza.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut


