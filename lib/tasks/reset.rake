namespace :challah do
  desc "Resets the database and add the base admin user, this runs nightly"
  task :reset => :environment do

    User.delete_all

    admin = User.new
    admin.first_name = "Admin"
    admin.last_name = "McGee"
    admin.username = "admin"
    admin.email = "admin@example.com"
    admin.role_id = Role[:administrator].id
    admin.password = 'test123'
    admin.password_confirmation = 'test123'
    admin.save

    puts "Reset!"
  end
end