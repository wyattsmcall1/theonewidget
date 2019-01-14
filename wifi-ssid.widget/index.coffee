# WiFi SSID Widget
#
# Joe Kelley
#
# This widget displays the current connected WiFi network name. It can be helpful if you are in an environment where multiple networks are available. 
# It uses the built-in OS X airport framework to get and display the SSID name (up to 20 characters in length)


command: "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep ' SSID' | cut -c 18-38"

refreshFrequency: 10000

# Adjust the style settings to suit. I've set the position to be just below the WiFi icon in my menu bar.

style: """
  top: 403px
  left: 220px
  color: #7dff7d
  font-family: San Francisco Display


  div
    display: block
    border-radius 5px
    text-shadow: 0 0 1px rgba(#000, 0.5)
    background: rgba(#FFF, 0.1)
    width: 94px
    font-size: 11px
    font-weight: 400
    padding: 10px 8px 2px 8px
    


    &:after
      content: 'WiFi SSID'
      font-family: Helvetica Neue
      text_align: "center"
      position: absolute
      color: #cece
      left: 40px
      top: 4px
      font-size: 9px
      font-weight: 300
      
 img
    height: 24px
    width: 24px
    margin-bottom: -3px
      
"""

render: -> """
  <div><img src="wifi-ssid.widget/icon48.png">
   <a class='ssid'></a></div>
"""

update: (out) ->
	if(out)
  		$('.ssid').html(out)
  	else
  		 $('.ssid').html(out + 'No WiFi')

