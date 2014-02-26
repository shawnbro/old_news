# user.rb

FactoryGirl.define do 
  factory :user do 
   first_name { Faker::Name.first_name }
   last_name { Faker::Name.last_name }
   email { Faker::Internet.email }
   password "shawn"
   password_confirmation "shawn"
 end
end

