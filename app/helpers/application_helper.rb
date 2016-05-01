module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = APP_NAME
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end


  def date_select_items
    s = ""
    s += "<li>" + link_to("Tomorrow", tomorrow_path) + "</li>" unless session[:path] == 'Tomorrow'
    s += "<li>" + link_to("Today", today_path) + "</li>" unless session[:path] == 'Today'

    # add next 4 days by DOW name
    days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    today = Date.today
    4.times do |i|
      d = Date.today + i + 2
      s += "<li><a href='/todos?d=" + d.to_s + "'>" + days[d.wday] + "</a></li>"
    end

    s += "<li>" + link_to("Someday", someday_path) + "</li>" unless session[:path] == 'Someday'
    return s
  end

end


