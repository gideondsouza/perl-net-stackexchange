package Net::StackExchange::V2::Tags;

use 5.006;
use strict;
use warnings FATAL => 'all';
use Sub::Name qw(subname);
use Net::StackExchange::V2::Common qw(query no_params one_param two_params);

our $VERSION = '0.01';

sub new {
	my ($class, $params) = @_;
    my $self = $params;
    bless $self, $class;

	*tags_all = subname(
	   "Net::StackExchange::V2::Tags::tags_all",
	   no_params("tags"),
	);
	*tags_info = subname(
	   "Net::StackExchange::V2::Tags::tags_info",
	   one_param("tags", "info"),
	);
	*tags_moderator_only = subname(
	   "Net::StackExchange::V2::Tags::tags_moderator_only",
	   no_params("tags/moderator-only"),
	);
	*tags_required = subname(
	   "Net::StackExchange::V2::Tags::tags_required",
	   no_params("tags/required"),
	);
	*tags_synonyms_all = subname(
	   "Net::StackExchange::V2::Tags::tags_synonyms_all",
	   no_params("tags/synonyms"),
	);
	*tags_faq = subname(
	   "Net::StackExchange::V2::Tags::tags_faq",
	   one_param("tags", "faq"),
	);
	*tags_related = subname(
	   "Net::StackExchange::V2::Tags::tags_related",
	   one_param("tags", "related"),
	);
	*tags_synonyms = subname(
	   "Net::StackExchange::V2::Tags::tags_synonyms",
	   one_param("tags", "synonyms"),
	);
	*tags_top_answerers = subname(
	   "Net::StackExchange::V2::Tags::tags_top_answerers",
	   two_params("tags", "top-answerers"),
	);
	*tags_top_askers = subname(
	   "Net::StackExchange::V2::Tags::tags_top_askers",
	   two_params("tags", "top-askers"),
	);
	*tags_wikis = subname(
	   "Net::StackExchange::V2::Tags::tags_wikis",
	   one_param("tags", "wikis"),
	);	
    return $self;
}
__END__
1; # End of Net::StackExchange::V2::Tags

=head1 NAME

Net::StackExchange::V2::Tags - The great new Net::StackExchange::V2::Tags!

=head1 VERSION

Version 0.01

=cut

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Net::StackExchange::V2::Tags;

    my $foo = Net::StackExchange::V2::Tags->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Gideon Israel Dsouza, C<< <gideon at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-net-stackexchange at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-StackExchange>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::StackExchange::V2::Tags


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