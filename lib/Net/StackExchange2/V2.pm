package Net::StackExchange2::V2;


use 5.006;
use strict;
use warnings FATAL => 'all';
use Net::StackExchange2::V2::Answers;
use Net::StackExchange2::V2::AccessTokens;
use Net::StackExchange2::V2::Badges;
use Net::StackExchange2::V2::Comments;
use Net::StackExchange2::V2::Errors;
use Net::StackExchange2::V2::Events;
use Net::StackExchange2::V2::Info;
use Net::StackExchange2::V2::Posts;
use Net::StackExchange2::V2::Privileges;
use Net::StackExchange2::V2::Questions;
use Net::StackExchange2::V2::Revisions;
use Net::StackExchange2::V2::Search;
use Net::StackExchange2::V2::Sites;
use Net::StackExchange2::V2::SuggestedEdits;
use Net::StackExchange2::V2::Tags;
use Net::StackExchange2::V2::Users;
use Net::StackExchange2::V2::Filters;
use Net::StackExchange2::V2::Inbox;
use Net::StackExchange2::V2::Notifications;

our $VERSION = '0.01';

sub new {
	my ($class, $params) = @_;
	my $self = undef;
	if($params) {
		$self =  $params;
	} else {
		$self = {};
	}
	bless $self, $class;
	return $self;
}
sub answers {
	my $self = shift;
	return Net::StackExchange2::V2::Answers->new($self);
}
sub access_tokens {
	my $self = shift;
	return Net::StackExchange2::V2::AccessTokens->new($self);
}
sub badges {
	my $self = shift;
	return Net::StackExchange2::V2::Badges->new($self);
}
sub comments {
	my $self = shift;
	return Net::StackExchange2::V2::Comments->new($self);
}
sub info {
	my $self = shift;
	return Net::StackExchange2::V2::Info->new($self);
}
sub posts {
	my $self = shift;
	return Net::StackExchange2::V2::Posts->new($self);
}
sub privileges {
	my $self = shift;
	return Net::StackExchange2::V2::Privileges->new($self);	
}
sub questions {
	my $self = shift;
	return Net::StackExchange2::V2::Questions->new($self);	
}
sub revisions {
	my $self = shift;
	return Net::StackExchange2::V2::Revisions->new($self);	
}
sub search {
	my $self = shift;
	return Net::StackExchange2::V2::Search->new($self);
}
sub sites {
	my $self = shift;
	$self->{site} = '';#THIS IS A special case. 
	#The sites module has only one sites_all method that SHOULD NOT has a site query str
	return Net::StackExchange2::V2::Sites->new($self);	
}
sub errors {
	my $self = shift;
	return Net::StackExchange2::V2::Errors->new($self);
}
sub suggested_edits {
	my $self = shift;
	return Net::StackExchange2::V2::SuggestedEdits->new($self);
}
sub tags {
	my $self = shift;
	return Net::StackExchange2::V2::Tags->new($self);
}
sub users {
	my $self = shift;
	return Net::StackExchange2::V2::Users->new($self);
}
sub events {
	my $self = shift;
	return Net::StackExchange2::V2::Events->new($self);
}
sub filters {
	my $self = shift;
	return Net::StackExchange2::V2::Filters->new($self);
}
sub inbox {
	my $self = shift;
	return Net::StackExchange2::V2::Inbox->new($self);
}
sub notifications {
	my $self = shift;
	return Net::StackExchange2::V2::Notifications->new($self);
}
1; #End of StackExchange2::V2
__END__

=head1 NAME

StackExchange API V2

=head1 VERSION

Version 0.01

=cut

=head1 SYNOPSIS

    use Net::StackExchange2;

	#For read-only methods.
    my $se = Net::StackExchange2->new({site => 'stackoverflow'});
	

=head1 Description

This module is an underlying wrapper for the various sub-modules for each stackexchange entitiy. 
Please see L<http://api.stackexchange.com/docs/> for information about the methods and their parameters

=head2 MODULES

=head3 Answer

=head3 Badges

=head3 Comments

=head3 Events

=head3 Info

=head3 Posts

=head3 Privileges

=head3 Questions

=head3 Revisions

=head3 Search

=head3 Suggested-Edits

=head3 Tags

=head3 Users

=head3 Network Methods:

=head3 Access-Tokens

=head3 Applications

=head3 Errors

=head3 Filters

=head3 Inbox

=head3 Notifications

=head3 Sites

=head3 Users


=head1 AUTHOR

Gideon Israel Dsouza, C<< <gideon at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-net-stackexchange2 at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-StackExchange2>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

See L<Net::StackExchange2>.

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Gideon Israel Dsouza.

This library is distributed under the freebsd license:

L<http://opensource.org/licenses/BSD-3-Clause> 
See FreeBsd in TLDR : L<http://www.tldrlegal.com/license/bsd-3-clause-license-(revised)>
