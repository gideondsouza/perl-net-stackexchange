package Net::StackExchange::V2::Users;

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

	*users_all = subname(
	   "Net::StackExchange::V2::Users::users_all",
	   no_params("users"),
	);
	*users = subname(
	   "Net::StackExchange::V2::Users::users",
	   one_param("users"),
	);
	*users_badges = subname(
	   "Net::StackExchange::V2::Users::users_badges",
	   one_param("users", "badges"),
	);
	*users_comments = subname(
	   "Net::StackExchange::V2::Users::users_comments",
	   one_param("users", "comments"),
	);
	*users_comments_toid = subname(
	   "Net::StackExchange::V2::Users::users_comments_toid",
	   two_params("users", "comments"),
	);
	*users_favorites = subname(
	   "Net::StackExchange::V2::Users::users_favorites",
	   one_param("users", "favorites"),
	);
	*users_mentioned = subname(
	   "Net::StackExchange::V2::Users::users_mentioned",
	   one_param("users", "mentioned"),
	);
	*users_merges = subname(
	   "Net::StackExchange::V2::Users::users_merges",
	   one_param("users", "merges", { no_site => 1}),
	);
	*users_notifications = subname(
	   "Net::StackExchange::V2::Users::users_notifications",
	   one_param("users", "notifications"),
	);
	*users_notifications_unread = subname(
	   "Net::StackExchange::V2::Users::users_notifications_unread",
	   one_param("users", "notifications/unread"),
	);
	*users_privileges = subname(
	   "Net::StackExchange::V2::Users::users_privileges",
	   one_param("users", "privileges"),
	);
	*users_questions = subname(
	   "Net::StackExchange::V2::Users::users_questions",
	   one_param("users", "questions"),
	);
	*users_questions_featured = subname(
	   "Net::StackExchange::V2::Users::users_questions_featured",
	   one_param("users", "questions/featured"),
	);
	*users_questions_no_answers = subname(
	   "Net::StackExchange::V2::Users::users_questions_no_answers",
	   one_param("users", "questions/no-answers"),
	);
	*users_questions_unaccepted = subname(
	   "Net::StackExchange::V2::Users::users_questions_unaccepted",
	   one_param("users", "questions/unaccepted"),
	);
	*users_questions_unanswered = subname(
	   "Net::StackExchange::V2::Users::users_questions_unanswered",
	   one_param("users", "questions/unanswered"),
	);
	*users_reputation = subname(
	   "Net::StackExchange::V2::Users::users_reputation",
	   one_param("users", "reputation"),
	);
	*users_reputation_history = subname(
	   "Net::StackExchange::V2::Users::users_reputation_history",
	   one_param("users", "reputation-history"),
	);
	*users_reputation_history_full = subname(
	   "Net::StackExchange::V2::Users::users_reputation_history_full",
	   one_param("users", "reputation-history/full"),
	);
	*users_suggested_edits = subname(
	   "Net::StackExchange::V2::Users::users_suggested_edits",
	   one_param("users", "suggested-edits"),
	);
	*users_tags = subname(
	   "Net::StackExchange::V2::Users::users_tags",
	   one_param("users", "tags"),
	);

	*users_tags_top_answers = subname(
	   "Net::StackExchange::V2::Users::users_tags_top_answers",
		#refined quite nicely. two params in this case takes three parts 
		#to the url
	   two_params("users", "tags", "top-answers"),
	);
	*users_tags_top_questions = subname(
	   "Net::StackExchange::V2::Users::users_tags_top_answers",
	   two_params("users", "tags","top-questions"),
	);
	#-------------------
	*users_timeline = subname(
	   "Net::StackExchange::V2::Users::users_timeline",
	   one_param("users", "timeline"),
	);
	*users_top_answers_tags = subname(
	   "Net::StackExchange::V2::Users::users_top_answers_tags",
	   one_param("users", "top-answer-tags"),
	);
	*users_top_question_tags = subname(
	   "Net::StackExchange::V2::Users::users_top_question_tags",
	   one_param("users", "top-question-tags"),
	);
	*users_write_permissions = subname(
	   "Net::StackExchange::V2::Users::users_write_permissions",
	   one_param("users", "write-permissions"),
	);
	*users_moderators = subname(
	   "Net::StackExchange::V2::Users::users_write_permissions",
	   no_params("users/moderators"),
	);    
	*users_moderators_elected = subname(
	   "Net::StackExchange::V2::Users::users_moderators_elected",
	   no_params("users/moderators/elected"),
	);    
	*users_associated = subname(
	   "Net::StackExchange::V2::Users::users_associated",
	   one_param("users","associated", {no_site => 1}),
	);
	*users_inbox = subname(
	   "Net::StackExchange::V2::Users::users_inbox",
	   one_param("users", "inbox"),
	);
	*users_inbox_unread = subname(
	   "Net::StackExchange::V2::Users::users_inbox_unread",
	   one_param("users", "inbox/unread"),
	);
	return $self;
}
=head1 NAME

Net::StackExchange::V2::Users - The great new Net::StackExchange::V2::Users!

=head1 VERSION

Version 0.01

=cut


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Net::StackExchange::V2::Users;

    my $foo = Net::StackExchange::V2::Users->new();
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

    perldoc Net::StackExchange::V2::Users


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
