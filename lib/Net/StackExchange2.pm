package Net::StackExchange2;

use 5.006;
use strict;
use warnings FATAL => 'all';
use Net::StackExchange2::V2;

our $VERSION = "0.01";
sub new {
	my $class = shift;#unused here
	my $params = shift;
	return Net::StackExchange2::V2->new($params);
}

1; # End of Net::StackExchange2
__END__

=head1 NAME

Net::StackExchange2 - Perl interface to the new StackExchange 2.1 API

=head1 VERSION

Version 0.01

=cut

=head1 SYNOPSIS

    use Net::StackExchange2;

	#For read-only methods.
    my $se = Net::StackExchange2->new({site => 'stackoverflow'});
	
	#OR
	
	#for methods that require auth.
	my $se = Net::StackExchange2->new(
	    {site=>"stackoverflow", access_token => '<THE ACCESS TOKEN>' , key => '<YOUR APP KEY>'}
	);
	
	#A few examples:
	
	#Every entity will have an xxx_all() that gets all records,
	#and another xxx() that takes ONE id or a number of ids
	
	my $ret =  $a->answers->answers_all({ order=> "desc", sort=>"votes" });
	my $ret = $a->answers->answers(14586834);#pass one single ID
	my $ret = $a->answers->answers([4449779, 4477003]);#or pass many in an array
	
	#my $ret  = $a->search->search({tagged=>"perl"});
	
	#my $ret = $a->tags->tags_top_askers("perl", "month");
	
	#filters are also supported. 
	#This method gets comments from one user to another and only retrives the body of the comment
	my $ret = $a->users->users_comments_toid(368070,22656, {filter => '!mRNaB_KjjP'});
	#see stackexchange api docs for more.
    ...


=head1 Description

This module is a perl wrapper to the stack exchange api. It mostly has a one to one mapping with the api 
methods documented here : L<http://api.stackexchange.com/docs>. Also see L<Net::StackExchange2::V2>. 

=head1 AUTHOR

Gideon Israel Dsouza, C<< <gideon at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-net-stackexchange2 at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-StackExchange2>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::StackExchange2

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-StackExchange2>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Net-StackExchange2>

=item * CPAN Ratings

Please give the module a nice rating if you think it was helpful :) L<http://cpanratings.perl.org/d/Net-StackExchange2>

=item * Search CPAN

L<http://search.cpan.org/dist/Net-StackExchange2/>

=back


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Gideon Israel Dsouza.

This library is distributed under the freebsd license:

L<http://opensource.org/licenses/BSD-3-Clause> 
See FreeBsd in TLDR : L<http://www.tldrlegal.com/license/bsd-3-clause-license-(revised)>
