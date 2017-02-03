email = ENV['admin_email']
password = ENV['admin_password']

puts "Hi, #{email}!"

puts "I am creating you as an admin user..."

admin_user = User.find_or_create_by(email: email, password: password)
admin_user.admin = true

if admin_user.save
  puts "You have been created as an admin user #{email}"
else
  puts 'error saving admin'
end
