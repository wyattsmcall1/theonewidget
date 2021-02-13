command: "cd"

command: "du -ch ~/.Trash | grep total | cut -c 1-5"

refreshFrequency: 10000

render: (output) -> """
  <div>
    <img src="trash-size.widget/icon.png">
    <a class="size">#{output}</a>
  </div>
"""

style: """
  top: 850px
  left: 440px
  font-size: 14px
  font-family: Helvetica Neue
  font-weight: 100
  color: #fff
  width: 45px
  height: 33px
  background-color: rgba(#FFF, 0.1)
  padding: 10px 10px 10px 10px
  border-radius: 5px

  img
    height: 28px
    margin-bottom: -3px

  a
    margin-left: -3px
"""

update: (output, domEl) ->
  if (output.indexOf(" 0B") > -1)
    $(domEl).find('.size').html("Empty")
  else
    $(domEl).find('.size').html(output)
