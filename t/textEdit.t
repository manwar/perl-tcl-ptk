use warnings;
use strict;
#use Tk;
#use Tk::TextEdit;

use Tcl::pTk;

use Test;
use Tcl::pTk::TextEdit;

plan tests => 1;

$| = 1; # Pipes Hot
my $top = MainWindow->new;
#$top->option('add','*Text.background'=>'white');

my $t = $top->Scrolled('TextEdit',"-relief" => "raised",
#my $t = $top->Text("-relief" => "raised",
                     "-bd" => "2",
                    );

my $m = $t->Menu();
$m->add("command", "-label" => "Open", "-underline" => 0,
        "-command" => \&sayopen);
$m->add("command", "-label" => "Close", "-underline" => 0,
        "-command" => \&sayclose);
$m->add("separator");
$m->add("command", "-label" => "Selection", "-underline" => 0,
        "-command" => \&showsel);
$m->add("separator");
$m->add("command", "-label" => "Exit", "-underline" => 1,
        "-command" => \&doexit);

$t->pack(-expand => 1, "-fill"   => "both");


$t->insert("0.0", "This window is a text widget.  It displays one or more
lines of text and allows you to edit the text.  Here is a summary of the
things you can do to a text widget:");

$t->insert(end => "

1. Insert text. Press the left mouse button to set the insertion cursor, then
type text.  What you type will be added to the widget.  You can backspace
over what you've typed using either the backspace key, the delete key,
or Control+h.

2. Resize the window.  This widget has been configured with the \"setGrid\"
option on, so that if you resize the window it will always resize to an
even number of characters high and wide.  Also, if you make the window
narrow you can see that long lines automatically wrap around onto
additional lines so that all the information is always visible.

3. Scanning. Press the middle mouse button in the text window and drag up or down.
This will drag the text at high speed to allow you to scan its contents.

4. Select. Press the left mouse button and drag to select a range of characters.
Once you've released the button, you can adjust the selection by pressing
the left mouse button with the shift key down.  This will reset the end of the
selection nearest the mouse cursor and you can drag that end of the
selection by dragging the mouse before releasing the mouse button.
You can double-click to select whole words, or triple-click to select
whole lines.

5. Delete. To delete text, select the characters you'd like to delete
and type Control+d.

6. Copy the selection. To copy the selection either from this window
or from any other window or application, select what you want, click
the left mouse button to set the insertion cursor, then type Control+v to copy the
selection to the point of the insertion cursor.

You can also bind commands to tags. Like press the right mouse button for menu ");


$top->after(1000,sub{$top->destroy});
MainLoop;
ok(1);

sub sayopen { print "Open something\n" }
sub sayclose { print "Close something\n" }
sub showsel  { my @info = $t->tagRanges('sel');
               if (@info)
                {
                 print "start=$info[0] end=$info[1]\n"
                }
             }
sub doexit
{
 $top->destroy;
}
