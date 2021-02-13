command: "./fan-bar.widget/script.sh"

refreshFrequency: 2000

style: """
  // Change bar height
  bar-height = 6px

  // Align contents left or right
  widget-align = left

  // Position this where you want
  top 402px
  left 10px

  // Statistics text settings
  color #fff
  font-family Helvetica Neue
  background rgba(#FFF, .1)
  padding 10px 15px 15px
  border-radius 5px

  .container
    width: 290px
    text-align: widget-align
    position: relative
    clear: both

  .widget-title
    text-align: widget-align

  .stats-container
    margin-bottom 5px
    border-collapse collapse

  td
    font-size: 14px
    font-weight: 300
    color: rgba(#fff, .9)
    text-shadow: 0 1px 0px rgba(#000, .7)
    text-align: widget-align

  .widget-title
    font-size 10px
    text-transform uppercase
    font-weight bold

  .label
    font-size 9px
    text-transform uppercase
    font-weight bold

  .bar-container
    width: 103%
    height: bar-height
    border-radius: bar-height
    float: widget-align
    clear: both
    background: rgba(#fff, .5)
    position: absolute
    margin-bottom: 5px

  .bar
    height: bar-height
    float: widget-align
    transition: width .2s ease-in-out

  .bar:first-child
    if widget-align == left
      border-radius: bar-height 0 0 bar-height
    else
      border-radius: 0 bar-height bar-height 0

  .bar:last-child
    if widget-align == right
      border-radius: bar-height 0 0 bar-height
    else
      border-radius: 0 bar-height bar-height 0



  .bar-leftPercent
    background: rgba(#fc0, .5)

  .bar-rightPercent
    background: rgba(#0bf, .5)

  .bar-cpuTemp
    background: rgba(#c00, .5)
"""


render: -> """
  <div class="container">
    <div class="widget-title">Fans</div>
    <table class="stats-container" width="115%">
      <tr>
        <td class="stat"><span class="left"></span></td>
        <td class="stat"><span class="leftPercent"></span></td>
        <td class="stat"><span class="right"></span></td>
        <td class="stat"><span class="rightPercent"></span></td>
        <td class="stat"><span class="cpuTemp"></span></td>
      </tr>
      <tr>
        <td class="label">Left</td>
        <td class="label">%</td>
        <td class="label">Right</td>
        <td class="label">%</td>
        <td class="label">CPU</td>
      </tr>
    </table>
    <div class="bar-container">
      <div class="bar bar-left"></div>
      <div class="bar bar-leftPercent"></div>
      <div class="bar bar-right"></div>
      <div class="bar bar-rightPercent"></div>
      <div class="bar bar-cpuTemp"></div>
    </div>
  </div>
"""

update: (output, domEl) ->
  updateBar = (sel, usage) ->
    if usage < 5
      percent = "5%"
    else
      percent = (usage/2) + "%"
    $(domEl).find(".bar-#{sel}").css "width", percent

  updateStat = (sel, usage) ->
    $(domEl).find(".#{sel}").text usage

  result = output.split " "

  left = result[0]
  leftPercent = result[1]

  right = result[2]
  rightPercent = result[3]

  cpuTemp = result[4]

  updateStat 'left', left
  updateStat 'right', right
  updateStat 'leftPercent', leftPercent
  updateStat 'rightPercent', rightPercent
  updateStat 'cpuTemp', cpuTemp

  updateBar 'rightPercent' , rightPercent
  updateBar 'leftPercent' , leftPercent
  # updateTempBar 'cpuTemp' , cpuTemp
