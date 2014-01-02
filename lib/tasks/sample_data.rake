namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(username: "example_user",
                         email: "example_user@example.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         author: true)
  end
end