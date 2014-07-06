class DailyBrief < ActionMailer::Base
  
  def welcome_email(user)
    @user = user
    @url  = new_session_url
    mail(
        to: "#{user.username} <#{user.email}>",
        from: "Admin <admin@topaz.ninja>",
        subject: 'Welcome to Topaz')
  end
  
  def daily_brief(user)
  end
  
end
