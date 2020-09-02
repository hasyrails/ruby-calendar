class CalendarController < ApplicationController

  def index
    @weekdays = ['日','月','火','水','木','金','土']
    @calendar_days = get_calendar_dates(Date.today)
  end

  def get_calendar_dates(date)
    get_pre_shortage_days(date) + (1..date.end_of_month.day).to_a + get_post_shortage_days(date)
  end

  # # その月の、"29 30" 1 のようなカレンダー不足分
  def get_pre_shortage_days(date)
    beginning_day = date.beginning_of_month
     return 0 if beginning_day.wday == 0
     pre_shortage_day = beginning_day - beginning_day.wday.days
     return (pre_shortage_day.day..pre_shortage_day.end_of_month.day).to_a
  end

  def get_post_shortage_days(date)
    end_day = date.end_of_month
    return 0 if end_day.wday == 6
    post_shortage_day = end_day + -(end_day.wday - 6).days
    return (1..post_shortage_day.day).to_a
  end
end
