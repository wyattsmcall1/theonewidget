command: "uptime-display.widget/show-uptime.sh"

refreshFrequency: 43200000

style: """
  top: 825px
  left: 10px
  color: #fff
  font-family: Helvetica Neue

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    background: rgba(#fff, 0.1)
    font-size: 25px
    font-weight: 100
    padding: 4px 6px 4px 6px
    border-radius 5px
    width: 118px

    &:after
      content: 'uptime'
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      font-weight: 500

"""

render: -> """
  <div class='uptime'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.uptime').html(output)