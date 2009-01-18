# This is a test of the BrowseEntry widget, a standard perl/tk megawidget


use Tcl::Tk qw/ :perlTk/;
use strict;
use Test;
use Tcl::Tk::Widget::ttkBrowseEntry;

#use Tk;
#use Tk::BrowseEntry;

plan tests => 4;

$| = 1;

my $top = MainWindow->new();


my @choices = (1..50);

#my @choices = (qw/ on11111111111111111111111111e two2222222222222222222 three333333333333 four444444444444444/);

my $ttkoption;
my $cb = $top->ttkBrowseEntry(-variable => \$ttkoption, -choices => 
   \@choices, 
  #-height => 20
  #-width => 2
  );
$cb->pack(-side => 'right'); #, -fill => 'x', -expand => 1);

#$cb->set("10");

# check delete method
$cb->delete(0, 'end');


my @choices2 = $cb->cget(-choices);
ok(@choices2, 0, "Empty Choices after delete");

$cb->insert(0, @choices);
@choices2 = $cb->cget(-choices);
ok(@choices2, 50, "Choices populated after insert");

#print "Combobox width  = ".$cb->cget(-width)."\n";
#print "Combobox height = ".$cb->cget(-height)."\n";


# $cb->bind('<<ComboboxSelected>>', 
#         sub{ 
#                 print "Selected args = ".join(', ', @_)."\n";
#                 print "get returns ".$cb->get()."\n";
#                 print "Variable is $ttkoption\n";
#                 });

# Check browsecmd operation
$top->after(1000, 
        sub{
        # Check browsecmd by sending virtual events
        my $selection;
        $cb->configure(-browsecmd => 
                sub{ 
                        my ($w, $value) = @_;
                        #print "browsecmd args ".join(", ", @_)."\n";
                        $selection = $value;
                        
                });
        
        $cb->set(3); # Make a selection
        # generate event that would happen if we actually made the selection in the GUI
        $cb->eventGenerate('<<ComboboxSelected>>');

        # check for browsecmd being called
        ok($selection, 3, "browsecmd check");
        
        $selection = undef;
        
        # Now check browse2cmd
        $cb->configure(-browsecmd => undef);
        

        $cb->configure(-browse2cmd => 
                sub{ 
                        my ($w, $value) = @_;
                        #print "browse2cmd args ".join(", ", @_)."\n";
                        $selection = $value;
                        
                });
                
        $cb->set(21); # Make a selection
        # generate event that would happen if we actually made the selection in the GUI
        $cb->eventGenerate('<<ComboboxSelected>>');

        ok($selection, 20, "browse2cmd check");
        });



$top->after(2000, sub{ $top->destroy() }) unless (@ARGV); # for debugging, don't go away if something on the command line
MainLoop;

#print "options = $ttkoption\n";





