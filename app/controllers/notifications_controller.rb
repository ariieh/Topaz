class NotificationsController < ApplicationController
  def url_path
    @notification = Notification.find(params[:id])
    @notification.update_attributes(read: true)
    redirect_to @notification.url
  end
end
