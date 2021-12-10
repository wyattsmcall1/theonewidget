###
------------------------------------------------------------------------
  Name:         os-version-uptime.widget
  Description:  Shows OS-Version and Up-Time for Übersicht
  Created:      18.Nov.2019
  Author:       Gert Massheimer
  Version:      2.0

  History:      2.0 Extended for Catalina
                    Added auto switch icon depending on dark-/light-mode
                1.0 Initial version
  Based on:
   OS Version Pro for Übersicht
   By Mike Pennella
   https://github.com/mpen01/os-version-pro
------------------------------------------------------------------------
###

# Change the theme variable below to style the widget
# THEME OPTIONS: mono, paper, color, dark

# theme = 'mono'
theme = 'paper'
# theme = 'color'
#theme = 'dark'
#-----------------------------------------------------------------------

# Show or hide the version build information in the widget
showBuild = true
# const showBuild  = false
#-----------------------------------------------------------------------

# Position the widget on the screen
pos1  = 'left: 190px'
pos2  = 'top: 848px'
#-----------------------------------------------------------------------

# --- Create the themes ------------------------------------------------
if theme == 'mono' or theme == 'dark'
  labelColor   = '#fff'    # white
  nameColor    = '#fff'    # white
  osColor      = '#fff'    # white
  lineColor    = '#fff'    # white
  uptimeColor  = '#ddd'    # light gray
  bkGround     = 'rgba(0, 0, 0, 0.5)'
  opacityLevel = '0.6'

else if theme == 'paper'
  labelColor   = '#fff'    # white
  nameColor    = '#fff'    # black
  osColor      = '#fff'    # black
  lineColor    = '#fff'    # white
  uptimeColor  = '#fff'    # gray
  bkGround     = 'rgba(255, 255, 255, 0.1)'
  opacityLevel = '1'

else # theme = color
  labelColor   = '#fff'    # white
  nameColor    = '#ffa640' # orange
  osColor      = '#7dff7d' # light green
  lineColor    = '#00bfff' # light blue
  uptimeColor  = '#e6273d' # red
  bkGround     = 'rgba(0, 0, 0, 0.5)'
  opacityLevel = '1'

if theme == 'dark'
  uptimeColor  = '#aaa'    # gray
  lineColor    = 'rgba(0, 0, 0, 0.6)'
#-----------------------------------------------------------------------

# --- Collect the data -------------------------------------------------
#noinspection JSUnusedGlobalSymbols
command: "os-version-uptime.widget/data.sh"

# --- Set the refresh frequency ----------------------------------------
refreshFrequency: '1m'

# --- render the widget ------------------------------------------------
render: -> """
  <div>
    <div class="osIcon"></div>
    <span class="osName"></span><span class="osRelease"></span>
    <p class="osVersion"></p>
    <p class="uptime"></p>
  </div>
"""

# --- Prepare the data to be rendered ----------------------------------
update: (output,domEl) ->
  [UP_Time, OS_Version, Interface] = output.split(/\r\n|\r|\n/g)

  # --- Create the up-time string --------------------------------------
  [d, dd, h, hh, m, mm] = UP_Time.split(" ")
  h  = if h  then h  else ''
  hh = if hh then hh else ''
  m  = if m  then m  else ''
  mm = if mm then mm else ''
  uptime = d + ' ' + dd + ' ' + h + ' ' + hh + ' ' + m + ' ' + mm

  # --- Create the OS information --------------------------------------
  [osName, osVersion, osBuild] = OS_Version.split(" ")
  iconDir = 'os-version-uptime.widget/icons/'

  icon = ''; osRelease = ''
  switch Number(osVersion.substr(0, 1))
    when 10
      switch Number(osVersion.substr(0, 5))
        when 10.10
          icon = iconDir + "yosemite.png"
          osRelease = ' Yosemite'
          break
        when 10.11
          icon = iconDir + "el_capitan.png"
          osRelease = ' El Capitan'
          break
        when 10.12
          icon = iconDir + "sierra.png"
          osRelease = ' Sierra'
          break
        when 10.13
          icon = iconDir + "high_sierra.png"
          osRelease = ' High Sierra'
          break
        when 10.14
          if Interface == 'Dark' then icon = iconDir + "mojave_dark.png" else icon = iconDir + "mojave.png"
          osRelease = ' Mojave'
          break
        when 10.15
          if Interface == 'Dark' then icon = iconDir + "catalina_dark.png" else icon = iconDir + "catalina.png"
          osRelease = ' Catalina'
          break
        else
          if Interface == 'Dark' then icon = iconDir + "monterey.png" else icon = iconDir + "monterey.png"
          osRelease = ' Monterey'
          break
    when 11
        if Interface == 'Dark' then icon = iconDir + "big_sur.png" else icon = iconDir + "big_sur.png"
        osRelease = ' Big Sur'
        break
    when 12
        if Interface == 'Dark' then icon = iconDir + "monterey.png" else icon = iconDir + "monterey.png"
        osRelease = ' Monterey'
        break
    else
        if Interface == 'Dark' then icon = iconDir + "monterey.png" else icon = iconDir + "monterey.png"
        osRelease = ' Monterey'
        break
    
        

  # --- Preparing the dom-elements for replacement ---------------------
  dom = $(domEl)
  dom.find('.osIcon').replaceWith('<img src="' + icon + '" />')

  if osName == 'OSX'
    osName = osName.substr(0,2) + " " + osName.substr(2,1)

  if osName != ''
    dom.find('.osName').html(osName)
    dom.find('.osRelease').html(osRelease)
    if showBuild == true
      dom.find('.osVersion').html('Version ' + osVersion + ' ' + osBuild)
    else
      dom.find('.osVersion').html('Version ' + osVersion)
  else
    dom.find('.osVersion').html('OS info is not available')

  dom.find('.uptime').html(uptime)

# --- Widget styles ----------------------------------------------------
style: """
  #{pos1}
  #{pos2}
  font-family system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto",
    "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue",
    sans-serif
  color #{uptimeColor}

  div
    font-size 1rem
    font-weight 400
    display block
    width 158px
    border 0px solid #{lineColor}
    border-radius 5px
    text-shadow 0 0 1px #{bkGround}
    background #{bkGround}
    opacity #{opacityLevel}
    padding 6px 8px 6px 3px

    &:after
      content ''
      position absolute
      left 0
      top -14px
      font-size .7rem
      font-weight 500
      color #{labelColor}

  .osName
    color #{osColor}
    font-size .7rem
    font-weight 600
    margin-left 2px
    margin-top 1px

  .osRelease
    font-size .9rem
    font-weight 400
    color #{osColor}
    margin 1px

  img
    height 40px
    width 40px
    margin-bottom -23px

  .osVersion, .uptime
    padding 0
    margin 0
    margin-left 43px
    font-size .5rem
    font-weight 400
    max-width 100%
    color #{nameColor}
    text-overflow ellipsis
    text-shadow none

  .uptime
    color #{uptimeColor}
"""
