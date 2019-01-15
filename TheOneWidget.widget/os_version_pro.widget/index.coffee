#-----------------------------------------------------------------------#
#																		#
# OS Version Pro for Übersicht 											#
# 																		#
# Created July 2018 by Mike Pennella									#
#																		#
# Change the theme variable below to style the widget					#
# THEME OPTIONS: mono, paper, color or dark	(default/blank is color)	#
theme		= 'dark'													#												
#																		#
# Show or hide the version build information in the widget				#
showBuild	= 'false'													#
#																		#
# Position the widget on the screen										#
pos_top		= '10px'													#
pos_left	= '10px'													#
#																		#
#-----------------------------------------------------------------------#

if theme == 'mono' || theme == 'dark'
  labelColor	= 'WHITE' 
  nameColor		= 'WHITE'
  uptimeColor	= 'WHITE'
  lineColor		= 'WHITE'
  bkground		= 'rgba(#FFF, 0.1)'
  opacityLevel	= '0.6'

else if theme == 'paper'
  labelColor	= 'WHITE' 
  nameColor		= 'BLACK'
  uptimeColor	= 'BLACK'
  lineColor		= 'WHITE'
  bkground		= 'rgba(#FFF, 0.1)'
  opacityLevel	= '0.8'

else
  labelColor	= 'WHITE' 
  nameColor		= '#D3D3D3'
  uptimeColor	= '#7dff7d'
  lineColor		= '#00BFFF'	  # Blue
  bkground		= 'rgba(#000, 0.5)'
  opacityLevel	= '1'
  
 if theme == 'dark' 
  bkground		= 'rgba(#FFF, 0.1)'
  lineColor		= 'rgba(#FFF, 0.1)'

command: "system_profiler SPSoftwareDataType | awk '{ if((/System Version/) && (/OS X/)) { print $3$4, $5, $6 }
													  else if (/System Version/) { print $3, $4, $5 } }'"

# Update every 24 hrs
refreshFrequency: 86400000

style: """
  top:	482px
  left: 10px
  font-family: Avenir Next
  color: #{uptimeColor}

  div
    display: block
    border: 1px solid #{lineColor}
    border-radius 5px
    text-shadow: 0 0 1px #{bkground}
    background: #{bkground}
    font-size: 12px
    font-weight: 400
    opacity: #{opacityLevel}
    padding: 4px 8px 4px 6px
    
    &:after
      content: ''
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      font-weight: 500
      color: #{labelColor}
   
  .osName
    font-size: 12px
    font-weight: 600
    color: #{uptimeColor}
    margin: 1px
    
  .osRelease
    font-size: 12px
    font-weight: 400
    color: #{uptimeColor}
    margin: 1px
      
  img
    height: 40px
    width: 40px
    margin-bottom: -20px
    
  .osVersion 
    padding: 0
    margin: 2px
    margin-left:48px
    font-size: 10px
    font-weight: 400
    max-width: 100%
    color: #{nameColor}
    text-overflow: ellipsis
    text-shadow: none
    
"""

render: -> """
  <div><img id="osIcon" src="">
  <a class='osName'><a class = 'osRelease'></a><p class='osVersion'></p></div>
"""

update: (output,domEl) ->
  values		= output.split(" ")
  osName 		= values[0]
  osVersion 	= values[1]
  osBuild		= values[2]
  div			= $(domEl)
  
  switch
    when osVersion.substr(0,5) == "10.10" then (document.getElementById("osIcon").src = "os_version_pro.widget/icons/yosemite.png") && (osRelease = ' Yosemite')
    when osVersion.substr(0,5) == "10.11" then (document.getElementById("osIcon").src = "os_version_pro.widget/icons/el_capitan.png") && (osRelease = ' El Capitan')
    when osVersion.substr(0,5) == "10.12" then (document.getElementById("osIcon").src = "os_version_pro.widget/icons/sierra.png") && (osRelease = ' Sierra')
    when osVersion.substr(0,5) == "10.13" then (document.getElementById("osIcon").src = "os_version_pro.widget/icons/high_sierra.png") && (osRelease = ' High Sierra')
    when ((osVersion.substr(0,5) == "10.14") && (theme == 'dark')) then (document.getElementById("osIcon").src = "os_version_pro.widget/icons/mojave_dark.png") && (osRelease = ' Mojave')
    when osVersion.substr(0,5) == "10.14" then (document.getElementById("osIcon").src = "os_version_pro.widget/icons/mojave.png") && (osRelease = ' Mojave')
    else document.getElementById("osIcon").src = "os_version_pro.widget/icons/mac_os.png"

  if (osName == 'OSX')
    osName = osName.substr(0,2) + " " + osName.substr(2,1)
  
  if (osName != '')
    div.find('.osName').html(osName)
    div.find('.osRelease').html(osRelease)
    if showBuild == 'true'
      div.find('.osVersion').html('Version ' + osVersion + ' ' + osBuild)
    else
      div.find('.osVersion').html('Version ' + osVersion)
  else
    div.find('.osVersion').html('OS info is not available')
  		 