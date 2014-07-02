class Api::NotificationsController < ApplicationController
  def show
    @notification = Notification.find(params[:id])
    render partial: "api/notifications/notification", locals: { notification: @notification }
  end
  
  
  def update
    @notification = Notification.find(params[:id])
    @notification.update_attributes(self.notification_params)
    render partial: "api/notifications/notification", locals: { notification: @notification }
  end
  
  protected
  
  def notification_params
    self.params.permit(:read)
  end
end