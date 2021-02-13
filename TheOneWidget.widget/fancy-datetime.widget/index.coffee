###
----------------------------------------------------------------

    Fancy DateTime - v1.0.0

    Uebersicht-widget for displaying the current time and date


    Robin 'codeFareith' von den Bergen
    robinvonberg@gmx.de
    https://github.com/codefareith

----------------------------------------------------------------
###

# Widget Settings
settings =
    lang: 'en'
    militaryTime: false
    colors:
      default: 'rgba(255, 255, 255, .75)'
      accent: 'rgba(255, 255, 255, .75)'
      background: 'rgba(255, 255, 255, .1)'
    shadows:
      box: '0 0 1.25em rgba(0, 0, 0, 0)'
      text: '0 0 0.625em rgba(0, 0, 0, .25)'

# Locale Strings
locale =
  en:
    weekdays: [
      'Sunday'
      'Monday'
      'Tuesday'
      'Wednesday'
      'Thursday'
      'Friday'
      'Saturday'
    ]
    months: [
      'January'
      'February'
      'March'
      'April'
      'May'
      'June'
      'July'
      'August'
      'September'
      'October'
      'November'
      'December'
    ]
  de:
    weekdays: [
      'Sonntag'
      'Montag'
      'Dienstag'
      'Mittwoch'
      'Donnerstag'
      'Freitag'
      'Samstag'
    ]
    months: [
      'Januar'
      'Februar'
      'März'
      'April'
      'Mai'
      'Juni'
      'Juli'
      'August'
      'September'
      'Oktober'
      'November'
      'Dezember'
    ]

command: ""

settings: settings
locale: locale

refreshFrequency: 1000

style: """
  top: 955px
  left: 297px
  font-family: 'Ubuntu', sans-serif
  font-size: 6px
  line-height: 1
  text-transform: uppercase
  transform: translate(-50%, -50%)

  .container
    position: relative
    display: table
    height: 134px
    padding: 1px 2px
    width: 216px
    height: 100px
    border-radius: 5px
    background: #{ settings.colors.background }
    box-shadow: #{ settings.shadows.box }
    text-shadow: #{ settings.shadows.text }
    overflow: hidden
    -webkit-backdrop-filter: blur(10px)

  .cell
    position: relative
    display: table-cell
    vertical-align: middle
    overflow: hidden

  .left
    float: left

  .txt-default
    color: #{ settings.colors.default }

  .txt-accent
    color: #{ settings.colors.accent }

  .txt-small
    font-size: 14px
    font-weight: 500

  .txt-large
    font-size: 36px
    font-weight: 700

  .divider
    display: block
    width: 2px
    height: 100%
    margin: 0 1px
    background: #{ settings.colors.accent }
    box-shadow: #{ settings.shadows.text }
    border-radius 5px
"""

render: () -> """
  <div class='container'>
    <div class='cell'>
      <span class='hours txt-default txt-large left'></span>
      <span class='minutes txt-accent txt-large left'></span>
      <span class='suffix txt-default txt-small'></span>
    </div>
    <div class='cell'>
      <span class='divider'></span>
    </div>
    <div class='cell txt-small'>
      <span class='weekday txt-accent'></span>
      <div class='txt-default'>
        <span class='day'></span>
        <span>|</span>
        <span class='month'></span>
      </div>
      <span class='year txt-accent'></span>
    </div>
  </div>
"""

afterRender: (domEl) ->

update: (output, domEl) ->
  date = @getDate()

  $(domEl).find('.hours').text(date.hours)
  $(domEl).find('.minutes').text(date.minutes)
  $(domEl).find('.suffix').text(date.suffix)
  $(domEl).find('.weekday').text(date.weekday)
  $(domEl).find('.day').text(date.day)
  $(domEl).find('.month').text(date.month)
  $(domEl).find('.year').text(date.year)

# Helper-Functions
zeroFill: (value) ->
  return ('0' + value).slice(-2)

getDate: () ->
  date = new Date()
  hour = date.getHours()

  suffix = (if (hour >= 12) then 'pm' else 'am') if (@settings.militaryTime is false)
  hour = (hour % 12 || 12) if (@settings.militaryTime is false)

  hours = @zeroFill(hour);
  minutes = @zeroFill(date.getMinutes())
  seconds = @zeroFill(date.getSeconds())
  weekday = @locale[@settings.lang].weekdays[date.getDay()]
  day = @zeroFill(date.getDate())
  month = @locale[@settings.lang].months[date.getMonth()]
  year = date.getFullYear()

  return {
    suffix: suffix
    hours: hours
    minutes: minutes
    seconds: seconds
    weekday: weekday
    day: day
    month: month
    year: year
  }
