#! /usr/bin/osascript

on run (arguments)
	set targetdate to (first item of arguments) 
	tell application "Calendar"
		activate
		view calendar at (my (date targetdate))
		switch view to day view
	end tell
	
end run
