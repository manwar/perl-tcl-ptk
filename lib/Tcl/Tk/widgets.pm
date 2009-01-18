#

=head1 NAME

Tcl::Tk::widgets -  Convenience Module for loading Tcl::Tk Widgets


=head1 SYNOPSIS

        use Tcl::Tk;
        
        # Load Text and Tree widgets (without have to call our on separate lines.)
        use Tcl::Tk::widgets qw/ Text Tree /;
        
        # Above is equivalent to
        use Tcl::Tk::Widget::Text;
        use Tcl::Tk::Widget::Tree;

=head1 DESCRIPTION

I<Tcl::Tk::widget> is a module for loading multiple widgets, without having to call-out each on separate
'use' lines. See the I<SYNOPSIS> line above for examples.

=cut



package Tcl::Tk::widgets;
use Carp;


sub import
{
 my $class = shift;
 foreach (@_)
  {
   local $SIG{__DIE__} = \&Carp::croak;
   # carp "$_ already loaded" if (exists $INC{"Tk/$_.pm"});
   require "Tcl/Tk/Widget/$_.pm";
  }
}

1;
__END__

=cut
