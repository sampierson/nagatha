class NagMailer < ActionMailer::Base
  default :from => "auntie@nagatha.com"

  def nag_email(user, todo_items)
    @todos = todo_items
    mail(:to => user.email,
         :subject => "Today's To-Do Items")
  end
end
