Installation:

1. Move folder-launcher.widget to your Übersicht widgets folder.
2. Open index.coffee and find the line just below "afterRender: (domEl) ->"
3. Replace "USER" in the aforementioned line with your username (home folder name)
4. Save
5. The second button is meant to open your computer "folder", however, this "folder" does not actually have a path, thus you must set the "New Finder windows show:" option in Finder preferences to open your computer for this button to function properly.
6. Whatever this option is set to is what the second button will open. If you prefer new Finder windows to show something else, just delete this button (see below).
5. Enjoy!

Customization:

1. Changing layout:
  a. The default layout is 1x9. You will notice after every two occurences of <li>...</li> tags, there is a <br> tag
  b. This is a line break tag, that will shift any buttons that come after it down 1 line
  c. For example, if you would like to have 3 buttons per line, simply add a <br> tag after every three occurences of <li>...</li> tags
  d. You may choose any configuration, so long as <br> tags are properly placed

2. Adding more buttons:
  a. Under "render: ->", create a new line "<li class="button" id="ID">" (without the opening and closing quotations)
  b. Replace "ID" with a UNIQUE ID. This can be anything, however you cannot use spaces, and it must be unique
  c. Create another new line under that, "  <img src="app-launcher.widget/Icons/ICON.png">" (without the opening and closing quotations)
  d. Replace "ICON" with the name of the icon you'd like to use
  e. Create one more new line under that, "</li>
  f. Add the icon you'd like to use to the folder "app-launcher.widget/Icons/"
  g. Under "afterRender: (domEl) ->", create a new line "$(domEl).on 'click', '#ID', => @run "open /PATH"" (without the opening and closing quotations)
  h. Replace "ID" with the unique ID you chose in step b
  i. Replace "PATH" with the path of the folder you'd like to open
  
3. Deleting buttons:
  a. Under "render: ->", delete everything between the <li> and </li> tags surrounding the button you'd like to delete
  b. Under "afterRender: (domEl) ->", delete the line that corresponds to the button you'd like to delete

4. Changing icons:
  a. In "app-launcher.widget/Icons/", add your desired icon
  b. Set "PATH" in "<img src="PATH">" to the path of your desired icon (relative to the "/Übersicht/widgets/" folder)

Inspiration comes from ddgond's "uebersicht-grid-launcher": https://github.com/ddgond/uebersicht-grid-launcher
Check it out if you would rather have a grid of colorful solid buttons to launch your folders, though some (easy) modifications will need to be made as his widget by default is used to open applications.

All icons are simply the default Apple icons from the sidebar in Finder, slightly edited by myself.
