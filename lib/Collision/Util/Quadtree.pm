package Collision::Util::Quadtree;

use strict;
use warnings;

use Collision::Util::Quadtree::Node;

sub new {
    my ($class, %options) = @_;

    my $self = bless {}, $class;

    $options{max_depth} = 7 unless exists $options{max_depth};
    $options{max_items} = 8 unless exists $options{max_items};

    $self->{root} = Collision::Util::Quadtree::Node->new( %options, depth => 0, parent => undef );

    foreach my $item (@{ $options{items} }) {
        $self->insert_item($item);
    }

    return $self;
}

sub insert {
    my ($self, $item) = @_;
    $self->{root}->insert($item);
}

sub get_collisions {
    my ($self, $rect) = @_;

    $rect ||= $self->{root};

    return $self->{root}->get_collisions($rect);
}

1;

__END__
