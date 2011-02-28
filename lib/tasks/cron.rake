desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  puts "Sending daily reminder emails..."
  User.all.each do |u|
    next if u.todo_items.empty?
    puts "Sending email to #{u.email}"
    NagMailer.nag_email(u).deliver
  end
  puts "done"
end
