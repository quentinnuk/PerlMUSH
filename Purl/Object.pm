package Purl::Object;

use strict;

sub new {
    my $proto = shift;
    my $enactor = shift;
    my $class = ref($proto) || $proto;
    my $self = {};
    $self->{_CREATED} = time;
    $self->{_CREATEDBY} = $enactor;
    $self->{_LASTMOD} = time;
    $self->{_LASTMODBY} = $enactor;
    bless ($self, $class);
    return $self;
}

sub AUTOLOAD {
    my $self = shift;
    my $type = ref($self) or croak "$self is not an object";
    my $name = $AUTOLOAD;
    $name =~ s/.*://;   # strip fully-qualified portion
    if (exists $self->{_permitted}->{$name} ) {
        croak "Can't access $name field in class $type";
    }
    if (@_) {
        return $self->{$name} = shift;
    } else {
        return $self->{$name};
    }
}

sub name {
    my $self = shift;
    if (@_) { $self->{name} = shift }
    return $self->{name};
}

sub location {
	my $self = shift;
	if (@_) { $self->{location} = shift }
	return $self->{location};
}

sub home {
	my $self = shift;
	if (@_) { $self->{home} = shift }
	return $self->{home};
}

sub contents {
	my $self = shift;
	if (@_) { push @($self->{contents}), shift }
	return \@($self->{contents});
}

sub sex {
	my $self = shift;
	if (@_) { $self->{sex} = shift }
	return $self->{sex};
}

sub owner {
	my $self = shift;
	if (@_) { $self->{owner} = shift }
	return $self->{owner};
}


1;
