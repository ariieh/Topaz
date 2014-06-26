class Notification < ActiveRecord::Base
  validates :notification_type, :user_id, presence: true
  belongs_to :user
  
  def message
    case self.notification_type
    when 1
      return "Welcome to Topaz!"
    when 2
      return "Someone commented on your article."
    when 3
      return "Someone liked your article!"
    else
      return nil
    end
  end
end
