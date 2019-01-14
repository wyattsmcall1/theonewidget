# WiFi Transmission Speed Widget
#
# Joe Kelley
#
# Unlike the little "signal strength" icon, this simple little widget tells you how fast your WiFi connection is actually communicating
# It uses the built-in OS X airport framework to get the actual transmission speed calculated using the most recent wireless network traffic
# It is particularly useful for finding the best place to position your computer and/or access point for best performance.

command: "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep TxRate | cut -c 18-20"

refreshFrequency: 10000

# Adjust the style settings to suit. I've set the position to be just below the WiFi icon in my menu bar.

style: """
  top: 443px
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
    padding: 10px 8px 2px 10px
    


    &:after
      content: 'WiFi Tx'
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
  <div><img src="wifi-tx-speed.widget/icon48.png">
   <a class='tx_speed'></a></div>
"""

update: (output) ->
	if(output)
  		$('.tx_speed').html(output + 'Mbps')
  	else
  		 $('.tx_speed').html(output + 'No WiFi')

