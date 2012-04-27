FactoryGirl.define do
  factory :user do
    email        'user@example.com'
    password     'password'
  end
  factory :book do
    title     'Moby Dick'
    author    'Herman Melville'
  end
end