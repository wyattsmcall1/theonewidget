command: ""

refreshFrequency: 300000

render: ->"""
<li class="button" id="1">
  <img src="app-launcher.widget/Icons/Terminal.png">
</li>
<br>
<li class="button" id="2">
  <img src="app-launcher.widget/Icons/Boot Camp Assistant.png">
</li>
<br>
<li class="button" id="3">
  <img src="app-launcher.widget/Icons/TextEdit.png">
</li>
<br>
<li class="button" id="4">
  <img src="app-launcher.widget/Icons/Stickies.png">
</li>
<br>
<li class="button" id="5">
  <img src="app-launcher.widget/Icons/Script Editor.png">
</li>
<br>
<li class="button" id="6">
  <img src="app-launcher.widget/Icons/Keychain Access.png">
</li>
<br>
<li class="button" id="7">
  <img src="app-launcher.widget/Icons/Automator.png">
</li>
<br>
<li class="button" id="8">
  <img src="app-launcher.widget/Icons/AirPort Utility.png">
</li>
<br>
<li class="button" id="9">
  <img src="app-launcher.widget/Icons/Console.png">
</li>
<br>
<li class="button" id="10">
  <img src="app-launcher.widget/Icons/Digital Color Meter.png">
</li>
<br>
<li class="button" id="11">
  <img src="app-launcher.widget/Icons/Activity Monitor.png">
</li>
<br>
<li class="button" id="12">
  <img src="app-launcher.widget/Icons/Grapher.png">
</li>
<br>
<li class="button" id="13">
  <img src="app-launcher.widget/Icons/System Information.png">
</li>
<br>
<li class="button" id="14">
  <img src="app-launcher.widget/Icons/Font Book.png">
</li>
<br>
<li class="button" id="15">
  <img src="app-launcher.widget/Icons/Disk Utility.png">
</li>
<br>
<li class="button" id="16">
  <img src="app-launcher.widget/Icons/QuickTime Player.png">
</li>
<br>
<li class="button" id="17">
  <img src="app-launcher.widget/Icons/Calculator.png">
</li>
<br>
<li class="button" id="18">
  <img src="app-launcher.widget/Icons/Dictionary.png">
</li>
"""

afterRender: (domEl) ->
  $(domEl).on 'click', '#1', => @run "osascript -e 'tell application \"Terminal\" to activate'" #"open /Applications/Utilities/Terminal.app"
  $(domEl).on 'click', '#2', => @run "osascript -e 'tell application \"Boot\ Camp\ Assistant\" to activate'" #"open '/Applications/Utilities/Boot\ Camp\ Assistant.app'"
  $(domEl).on 'click', '#3', => @run "osascript -e 'tell application \"TextEdit\" to activate'" #"open /Applications/TextEdit.app"
  $(domEl).on 'click', '#4', => @run "osascript -e 'tell application \"Stickies\" to activate'" #"open /Applications/Stickies.app"
  $(domEl).on 'click', '#5', => @run "osascript -e 'tell application \"Script\ Editor\" to activate'" #"open '/Applications/Utilities/Script\ Editor.app'"
  $(domEl).on 'click', '#6', => @run "osascript -e 'tell application \"Keychain\ Access\" to activate'" #"open '/Applications/Utilities/Keychain\ Access.app'"
  $(domEl).on 'click', '#7', => @run "osascript -e 'tell application \"Automator\" to activate'" #"open /Applications/Automator.app"
  $(domEl).on 'click', '#8', => @run "osascript -e 'tell application \"AirPort\ Utility\" to activate'" #"open '/Applications/Utilities/AirPort\ Utility.app'"
  $(domEl).on 'click', '#9', => @run "osascript -e 'tell application \"Console\" to activate'" #@run "open /Applications/Utilities/Console.app"
  $(domEl).on 'click', '#10', => @run "osascript -e 'tell application \"Digital\ Color\ Meter\" to activate'" #"open '/Applications/Utilities/Digital\ Color\ Meter.app'"
  $(domEl).on 'click', '#11', => @run "osascript -e 'tell application \"Activity\ Monitor\" to activate'" #"open '/Applications/Utilities/Activity\ Monitor.app'"
  $(domEl).on 'click', '#12', => @run "osascript -e 'tell application \"Grapher\" to activate'" #"open /Applications/Utilities/Grapher.app"
  $(domEl).on 'click', '#13', => @run "osascript -e 'tell application \"System\ Information\" to activate'" #"open '/Applications/Utilities/System\ Information.app'"
  $(domEl).on 'click', '#14', => @run "osascript -e 'tell application \"Font\ Book\" to activate'" #"open '/Applications/Font\ Book.app'"
  $(domEl).on 'click', '#15', => @run "osascript -e 'tell application \"Disk\ Utility\" to activate'" #"open '/Applications/Utilities/Disk\ Utility.app'"
  $(domEl).on 'click', '#16', => @run "osascript -e 'tell application \"QuickTime\ Player\" to activate'" #"open '/Applications/QuickTime\ Player.app'"
  $(domEl).on 'click', '#17', => @run "osascript -e 'tell application \"Calculator\" to activate'" #"open /Applications/Calculator.app"
  $(domEl).on 'click', '#18', => @run "osascript -e 'tell application \"Dictionary\" to activate'" #"open /Applications/Dictionary.app"

style: """
  position: fixed
  top: 8px
  left: 410px
  background:rgba(#FFF, .1)
  border-radius:10px

  img
    height: 35px

  .button
    display: inline

"""
