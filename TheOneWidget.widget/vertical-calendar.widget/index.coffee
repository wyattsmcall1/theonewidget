command: ""


# the refresh frequency in milliseconds
refreshFrequency: 60000

currentDate: null

style: """

  top: 7px
  left: 440px
  color: white

  .spacer
    width: 68px
    height: 5px
    clear: both
    margin-bottom: 3px

  .spacer.endOfWeek
    margin-bottom: 5px
    border-bottom: 1px solid #666

  .date
    font-family: Helvetica Neue
    font-size: 9pt
    margin: 0px

  .date > div.dayDisplay, .date > div.monthDisplay
    padding: 3px 3px 2px 6px
    background-color: rgba(#CACDCE,0.18) //rgba(155,155,155,0.40)
    border-radius: 5px

  .date > div.dayDisplay
    width: 55px
    float: left

  .date > div.monthDisplay
    float: left
    margin-left: 8px
    padding-right: 8px

  .date.today > div.dayDisplay
    background: #336699 //#28519a
    color: #fff
    border-color: #99c

"""

render: (output) -> """
    <div class="output">
    </div>
"""


update: (output, domEl) ->
  openCal = @run
  today = new Date((new Date()).toLocaleDateString())

  if this.currentDate != null && this.currentDate == today
    return
  else
    this.currentDate = today

  d_names = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
  m_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  startDate = new Date(today)
  startDate.setDate(startDate.getDate() - 6)

  dom = $(domEl)
  dom.find('.output').empty()

  showDate = (date) ->
    theDate = new Date(startDate)
    theDate.setDate(theDate.getDate() + date)
    dateString = if theDate.getDate() < 10 then '0' + theDate.getDate() else theDate.getDate()
    aid = ((theDate.getMonth()+1) + "-" + theDate.getDate() + "-" + theDate.getFullYear())

    dateDiv = $('<div class="date"></div>')
    dateDiv.append('<div class="dayDisplay" data-date="' +theDate + '" id="' + aid + '">' + dateString + ' • ' + d_names[theDate.getDay()] + '</div>')

    if theDate.toLocaleDateString() == startDate.toLocaleDateString() or theDate.getDate() == 1
      dateDiv.append('<div class="monthDisplay">' + m_names[theDate.getMonth()] + ' ' + theDate.getFullYear() + '</div>')

    if theDate.toLocaleDateString() == today.toLocaleDateString()
      dateDiv.addClass("today")

    dom.find('.output').append(dateDiv)

    dom.find('#' + aid).click ->
        openCal("./vertical-calendar.widget/openCalendar.scpt #{aid}",(error, output) ->
          console.log(error)
          )

    if date < 30
        spacer = $('<div class="spacer"></div>')
        if theDate.getDay() == 6
          spacer.addClass("endOfWeek")
        dom.find('.output').append(spacer)


  showDate date for date in [0..30]
