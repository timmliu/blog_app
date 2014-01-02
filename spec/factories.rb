FactoryGirl.define do
  factory :user do
    username     "foobar"
    email    "foobar@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end