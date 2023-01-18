class BusinessHour < ApplicationRecord
  belongs_to :restaurant
  delegate :user, :to => :restaurant, :allow_nil => true

  def hours
    if self.closed
      "Closed"
    else
      "#{human_time(self.open_at)} - #{human_time(self.close_at)}"
    end
  end

  def human_time(time)
    time = Time.parse(time)
    time.strftime("%l:%M %P")
  end
end
