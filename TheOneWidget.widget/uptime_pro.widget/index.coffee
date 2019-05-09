#-----------------------------------------------------------------------#
#																		#
# Uptime Pro for Übersicht 												#
# 																		#
# Created July 2018 by Mike Pennella (github.com/mpen01/uptime_pro)		#
#																		#
# Change the theme variable below to style the widget					#
# THEME OPTIONS: mono, paper, color or dark	(default is color)			#
# STYEL OPTIONS: min or full											#
theme		= 'dark'													#
style		= 'full'													#
#																		#
# POSITION WIDGET ON SCREEN												#
pos_top		= '1300px'													#
pos_left	= '15px'													#
#																		#
#-----------------------------------------------------------------------#

if theme == 'mono' || theme == 'dark'
  labelColor	= 'WHITE' 
  nameColor		= 'WHITE'
  uptimeColor	= 'WHITE'
  lineColor		= 'WHITE'
  bkground		= 'rgba(#000, 0.0)'
  opacityLevel	= '0.6'
  displayIcon		= "uptime_pro.widget/white_clock.png"

else if theme == 'paper'
  labelColor	= 'WHITE' 
  nameColor		= 'BLACK'
  uptimeColor	= 'BLACK'
  lineColor		= 'WHITE'
  bkground		= 'rgba(#fff, 1)'
  opacityLevel	= '0.8'
  displayIcon	= "uptime_pro.widget/black_clock.png"

else
  labelColor	= 'WHITE' 
  nameColor		= '#D3D3D3'
  uptimeColor	= '#7dff7d'
  lineColor		= '#00BFFF'	  # Blue
  bkground		= 'rgba(#000, 0.5)'
  opacityLevel	= '1'
  displayIcon	= "uptime_pro.widget/blue_clock.png"
  
 if theme == 'dark'
   labelColor	= 'WHITE' 
   bkground		= 'rgba(#fff, 0.1)'
   lineColor	= 'rgba(#fff, 0.1)'
   opacityLevel	= '1' 
   
if style == 'min'
   labelColor	= 'rgba(#000, 0.0)' 
   nameColor	= 'rgba(#000, 0.0)'
   lineColor	= 'rgba(#000, 0.0)'
   bkground		= 'rgba(#000, 0.0)'

 

command: "uptime | awk '{ if ((/day/ && /hr/) || (/day/ && /min/) || (/day/ && /sec/)){ print $3, substr($4, 1, length($4)-1), $5, substr($6, 1, length($6)-1) } 
						  else if (/day/) { print $3, substr($4, 1, length($4)-1), substr($5, 1, length($5)-1) }
						  else if (/sec/ || /min/ || /hr/)  { print $3, substr($4, 1, length($4)-1) }
						  else { print substr($3, 1, length($3)-1) } }' && scutil --get ComputerName"

# Update uptime every 60 secs
refreshFrequency: 60000

style: """
  top:	825px
  left:	10px
  font-family: Helvetica Neue
  color: #{uptimeColor}

  div
    display: block
    border: 0px solid #{lineColor}
    border-radius 5px
    text-shadow: 0 0 1px #{bkground}
    background: #{bkground}
    font-size: 16px
    font-weight: 400
    opacity: #{opacityLevel}
    padding: 6px 6px 10px 6px
    width: 118px
    
    &:after
      content: 'uptime'
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      font-weight: 500
      color: #{labelColor}
   
  .uptime
    font-size: 16px
    font-weight: 500
    color: #{uptimeColor}
    margin: 1px
      
  img
    height: 18px
    width: 18px
    margin-bottom: -3px
    
  .computername 
    padding: 0
    margin: 2px
    font-size: 12px
    font-weight: 300
    max-width: 100%
    color: #{nameColor}
    text-overflow: ellipsis
    text-shadow: none
    
"""

render: -> """
  <div>
  <a class='uptime'></a><p class='computername'></p></div>
"""

update: (output,domEl) ->
  values		= output.split("\n")
  uptime 		= values[0]
  computername 	= values[1]
  div			= $(domEl)

  if (uptime != '')
    div.find('.uptime').html(uptime)
    #div.find('.computername').html(computername)
  else
    div.find('.computername').html('Uptime is not available')
  		 
