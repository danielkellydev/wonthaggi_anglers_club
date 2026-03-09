User.find_or_create_by!(email_address: "admin@wonthaggiangling.com.au") do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

puts "Admin user created: admin@wonthaggiangling.com.au / password"
