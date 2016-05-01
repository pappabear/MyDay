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

    # add next 5 days by DOW name
    s += "<li><a href='#'>Tmorrow</a></li>" +
        "<li><a href='#'>Tmorrow</a></li>" +
        "<li><a href='#'>Tmorrow</a></li>" +
        "<li><a href='#'>Tmorrow</a></li>" +
        "<li><a href='#'>Tmorrow</a></li>"

    s += "<li>" + link_to("Someday", someday_path) + "</li>" unless session[:path] == 'Someday'
    return s
  end

end


