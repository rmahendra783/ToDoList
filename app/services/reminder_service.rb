# app/services/reminder_service.rb

class ReminderService
  def self.send_reminders
    # Fetch tasks with upcoming reminders
    byebug
    tasks_with_reminders = Task.where("due_date <= ?", Time.now + 1.hour)
    tasks_with_reminders.each do |task|
     # UserMailer.reminder_email(user).deliver_now

      # UserMailer.reminder_email(task.user, task).deliver_now
    end
  end

  def self.send_message 
  	puts "hello bro "
  end
end
