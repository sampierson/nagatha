class NagMailer < ActionMailer::Base
  default :from => "auntie@nagatha.com"

  def nag_email(user)
    @todos = user.todo_items.order('position').limit(2)
    mail(:to => user.email,
         :subject => "Today's To-Do Items")
  end
end
