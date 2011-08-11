desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  puts "Sending daily reminder emails..."
  User.all.each do |u|
    todo_items = u.todo_items.with_status('undone').order('position').limit(5)
    next if todo_items.empty?
    puts "Sending email to #{u.email}"
    NagMailer.nag_email(u, todo_items).deliver
  end
  puts "done"
end
