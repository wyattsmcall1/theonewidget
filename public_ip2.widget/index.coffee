command: "./public_ip2.widget/script.sh"

refreshFrequency: '1m'

style: """
  left 142px
  top 820px

  color white1
  white-space nowrap
  width 50px
  padding 1pxpx 1px 1pxpx 1px
  align-items right
  display flex
  color #fff
  font-family Helvetica Neue
  text-align right
  padding-left 0px
  
  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    background: rgba(#fff, 0.1)
    font-size: 31px
    font-weight: 100
    border-radius 5px
    

    &:after
      content: 'public IP'
      position: absolute
      left: 0px
      top: -14px
      font-size: 10px
      font-weight: 500

"""


render: -> """
  <div class='ip_address'></div>
"""

update: (output, domEl) ->
  result = output.split " "
  start = result[0].split ":"
  if start[0] == 'http'
    $(domEl).find('.ip_address').html('Not Connected')
  else
    $(domEl).find('.ip_address').html(result[0].concat(" <img src='", result[1], "' width='24' />"))

