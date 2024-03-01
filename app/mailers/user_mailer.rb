# app/mailers/user_mailer.rb

class UserMailer < ApplicationMailer
  def reminder_email(user, task)
    @user = user
    @task = task
    mail(to: @user.email, subject: 'Task Reminder')
  end
end
