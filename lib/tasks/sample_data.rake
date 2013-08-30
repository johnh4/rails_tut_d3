namespace :db do
	desc "Fill the database with sample users"
	task populate: :environment do
		make_users
	end

	def make_users
		User.create!(name: "John Howlett", email: "jhowlett4@example.com",
			         password: "password", password_confirmation: "password",
			         admin: true)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			password_confirmation = "password"
			User.create!(name: name, email: email, password: password,
						 password_confirmation: password_confirmation)
		end
	end
end