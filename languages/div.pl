#!/usr/bin/perl
use strict;
use warnings;

package DivError;
use base 'Exporter';
our @EXPORT = qw(DivError);

sub new {
    my ($class, $message) = @_;
    $message //= "division by zero";
    return bless { message => $message }, $class;
}

sub message {
    my $self = shift;
    return $self->{message};
}

package main;

sub div {
    my ($x, $y) = @_;
    if ($y == 0) {
        die DivError->new();
    }
    return $x / $y;
}

sub main {
    my ($x, $y) = (1.0, 0.0);
    
    eval {
        my $z = div($x, $y);
        print "The result is: $z\n";
    };
    
    if ($@) {
        if (ref($@) eq 'DivError') {
            print STDERR "Division failed: " . $@->message() . "\n";
        } else {
            print STDERR "Division failed: division by zero\n";
        }
    }
}

main();