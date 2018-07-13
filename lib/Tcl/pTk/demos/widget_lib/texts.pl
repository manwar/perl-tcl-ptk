# texts.pl

use vars qw/$TOP/;

sub texts {

    # Create a top-level window that displays a basic text widget.

    my ($demo) = @_;
    $TOP = $MW->WidgetDemo(
        -name     => $demo,
        -text     => '',
        -title    => 'Text Demonstration - Basic Facilities',
        -iconname => 'texts',
    );

    my $t = $TOP->Scrolled(qw/Text -relief sunken -borderwidth 2 -setgrid true
			   -height 30 -scrollbars e/);
    $t->pack(qw/-expand yes -fill both/);

    $t->insert('0.0', 'This window is a text widget.  It displays one or more lines of text
and allows you to edit the text.  Here is a summary of the things you
can do to a text widget:

1. Scrolling. Use the scrollbar to adjust the view in the text window.

2. Scanning. Press the middle mouse button in the text window and drag up or down.
This will drag the text at high speed to allow you to scan its contents.

3. Insert text. Press the left mouse button to set the insertion cursor, then
type text.  What you type will be added to the widget.

4. Select. Press the left mouse button and drag to select a range of characters.
Once you\'ve released the button, you can adjust the selection by pressing
the left mouse button with the shift key down.  This will reset the end of the
selection nearest the mouse cursor and you can drag that end of the
selection by dragging the mouse before releasing the mouse button.
You can double-click to select whole words or triple-click to select
whole lines.

5. Delete and replace. To delete text, select the characters you\'d like
to delete and type Backspace or Delete.  Alternatively, you can type new
text, in which case it will replace the selected text.

6. Copy the selection. To copy the selection into this window, select
what you want to copy (either here or in another application), then
click the middle mouse button to copy the selection to the point of the mouse cursor.

7. Edit.  Text widgets support the standard Motif editing characters
plus many Emacs editing characters.  Backspace and Control-h erase the
character to the left of the insertion cursor.  Delete and Control-d
erase the character to the right of the insertion cursor.  Meta-backspace
deletes the word to the left of the insertion cursor, and Meta-d deletes
the word to the right of the insertion cursor.  Control-k deletes from
the insertion cursor to the end of the line, or it deletes the newline
character if that is the only thing left on the line.  Control-o opens
a new line by inserting a newline character to the right of the insertion
cursor.  Control-t transposes the two characters on either side of the
insertion cursor.

7. Resize the window.  This widget has been configured with the "setGrid"
option on, so that if you resize the window it will always resize to an
even number of characters high and wide.  Also, if you make the window
narrow you can see that long lines automatically wrap around onto
additional lines so that all the information is always visible.');

    $t->mark(qw/set insert 0.0/);

} # end texts

1;
