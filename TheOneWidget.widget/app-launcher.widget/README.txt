Installation:

1. Move app-launcher.widget to your Übersicht widgets folder.
2. Enjoy!

Customization:

1. Changing layout:
  a. The default layout is 2x9. You will notice after every two occurences of <li>...</li> tags, there is a <br> tag
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
  g. Under "afterRender: (domEl) ->", create a new line "$(domEl).on 'click', '#ID', => @run "open /Applications/APPLICATION.app"" (without the opening and closing quotations)
  h. Replace "ID" with the unique ID you chose in step b
  i. Replace "APPLICATION" with the name of the application you'd like to open
  
3. Deleting buttons:
  a. Under "render: ->", delete everything between the <li> and </li> tags surrounding the button you'd like to delete
  b. Under "afterRender: (domEl) ->", delete the line that corresponds to the button you'd like to delete

4. Changing icons:
  a. In "app-launcher.widget/Icons/", add your desired icon
  b. Set "PATH" in "<img src="PATH">" to the path of your desired icon (relative to the "/Übersicht/widgets/" folder)

Inspiration comes from ddgond's "uebersicht-grid-launcher": https://github.com/ddgond/uebersicht-grid-launcher
Check it out if you would rather have a grid of colorful solid buttons to launch your applications.

Icons included are from Noshery's "Minimalist White Icons": http://noshery.deviantart.com/art/Minimalist-White-Icons-Mac-OS-X-470738808
Feel free to download the complete package if you'd like to add more buttons and stay consistent with the theme! It comes with icons for almost any app you can think of!

