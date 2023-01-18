module ApplicationHelper
  def human_boolean(boolean)
    boolean ? "Yes" : "No"
  end

  def human_time(time)
    time = Time.parse(time)
    time.strftime("%l:%M %P")
  end
end
