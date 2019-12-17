#-----------------------------------------------------------------------#
#																		#
# Battery Pro for Übersicht 											#
# 																		#
# Created July 2018 by Mike Pennella (github.com/mpen01/battery_pro)	#
#																		#
# THEME & STYLE OPTIONS													#
# Change the variables below to change the appearance of the widget		#
theme		= 'color'	# mono, paper, color or dark (default is color)	#
style		= 'full'	# mini or full	(default is full)				#
#																		#
# LOW POWER THRESHHOLD													#
# Battery indicators turn red if battery is discharging and				#
# below this number.  Default is 20%, you may want it higher or lower	#
lowPower	= 20														#
#																		#
# POSITION WIDGET ON SCREEN												#
pos_top		= '870px'													#
pos_left	= '440px'													#
#																		#
#-----------------------------------------------------------------------#

labelColor			='WHITE'
opacityLevel		='1'

if theme == 'mono' || theme == 'dark'
  statusColor		= 'WHITE'
  chargingColor		= 'WHITE'
  dischargeColor	= 'WHITE'
  lowPowerColor		= 'WHITE'
  lineColor			= 'WHITE'
  bkground			= 'rgba(#000, 0.1)'
  fullCharge		= "battery_pro.widget/icons/white_full_charge.png"
  almostFullCharge	= "battery_pro.widget/icons/white_almost_charged.png"
  halfCharged		= "battery_pro.widget/icons/white_half_charged.png"
  lowCharge			= "battery_pro.widget/icons/low-battery.png"
  batteryCharging	= "battery_pro.widget/icons/white_charging.png"
  batteryCharged	= "battery_pro.widget/icons/white_full_charge.png"
  
else if theme == 'paper'
  statusColor		= 'BLACK'
  chargingColor		= 'BLACK'
  dischargeColor	= 'BLACK'
  lowPowerColor		= 'BLACK'
  lineColor			= 'WHITE'
  bkground			= 'rgba(#fff, 0.1)'
  fullCharge		= "battery_pro.widget/icons/black_full_charge.png"
  almostFullCharge	= "battery_pro.widget/icons/black_almost_charged.png"
  halfCharged		= "battery_pro.widget/icons/black_half_charged.png"
  lowCharge			= "battery_pro.widget/icons/low-battery.png"
  batteryCharging	= "battery_pro.widget/icons/black_charging.png"
  batteryCharged	= "battery_pro.widget/icons/black_full_charge.png"
  
else
  statusColor		= '#D3D3D3'   # Grey
  chargingColor		= '#7dff7d'   # Bright Green
  dischargeColor	= 'WHITE'
  lowPowerColor		= '#FF0000'   # Red
  #lineColor			= '#00BFFF'	  # Blue
  bkground			= 'rgba(#FFF, 0.1)'
  fullCharge		= "battery_pro.widget/icons/full_charge.png"
  almostFullCharge	= "battery_pro.widget/icons/almost_charged.png"
  halfCharged		= "battery_pro.widget/icons/half_charged.png"
  lowCharge			= "battery_pro.widget/icons/low-battery.png"
  batteryCharging	= "battery_pro.widget/icons/white_charging.png"
  batteryCharged	= "battery_pro.widget/icons/blue_charged.png"
  
if theme == 'dark'
   bkground			= 'rgba(#000000)'
   lineColor		= 'rgba(#000000, 0.8)'
   opacityLevel		= '0.6'
   
if style == 'mini'
   labelColor		= 'rgba(#000, 0.0)' 
   statusColor		= 'rgba(#000, 0.0)'  
   lineColor		= 'rgba(#000, 0.0)' 
   bkground			= 'rgba(#000, 0.0)'

command: "pmset -g batt | grep -o '[0-9]*%; [a-z]*'"

# Refresh the widget every 10 seconds
refreshFrequency: 10000

style: """
  top:	#{pos_top}
  left:	#{pos_left}
  font-family: Avenir Next

  div
    display: block
    border: 1px solid #{lineColor}
    border-radius 5px
    text-shadow: 0 0 1px #{bkground}
    background: #{bkground}
    font-size: 12px
    font-weight: 400
    width: 55px
    opacity: #{opacityLevel}
    padding: 2px 8px 2px 2px

    &:after
      content: 'BATTERY'
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      font-weight: 500
      color: #{labelColor}
  
  .percent
    font-size: 13px
    font-weight: 500
    margin: 0
    
  img
    height: 18px
    width: 18px
    margin-bottom: -3px
	
  .status
    padding: 0
    margin: 0
    margin-top: -2px
    margin-left: 4px
    font-size: 10px
    font-weight: 400
    max-width: 100%
    color: #{statusColor}
    text-overflow: ellipsis
    text-shadow: none

"""


render: -> """
  <div><img id="batt_icon" src=fullCharge>
  <a class='percent'></a><p class='status'></p></div>
"""

update: (output, domEl) ->
  values 	= output.split(";")
  percent 	= values[0]
  status 	= values[1].trim()
  div     	= $(domEl)
 
  if status == "discharging" && +(percent.substring(0, percent.length - 1)) <= lowPower
    div.find('.percent').html(percent.fontcolor(lowPowerColor)) 
    status = 'plug in soon'
    document.getElementById("batt_icon").src=lowCharge
  
  else if status == "discharging"
    div.find('.percent').html(percent.fontcolor(dischargeColor)) 
    if +(percent.substring(0, percent.length - 1)) >= 90
      document.getElementById("batt_icon").src=fullCharge
    else if +(percent.substring(0, percent.length - 1)) > 60
      document.getElementById("batt_icon").src=almostFullCharge
    else if +(percent.substring(0, percent.length - 1)) > 20
      document.getElementById("batt_icon").src=halfCharged
  
  else if status == "charging"  || status == "finishing"
    document.getElementById("batt_icon").src=batteryCharging
    div.find('.percent').html(percent.fontcolor(chargingColor)) 
  
  else if status == "charged"
    document.getElementById("batt_icon").src=batteryCharged
    div.find('.percent').html(percent.fontcolor(chargingColor))
    
  else
    div.find('.percent').html(percent.fontcolor(chargingColor))
    document.getElementById("batt_icon").src=batteryCharging
    status = 'AC attached'
    
  div.find('.status').html(status)
  
  

