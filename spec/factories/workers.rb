FactoryGirl.define do
  factory :worker, class: Worker do
    email 'email@email.com'
    password '123456'
    id 1
  end
end
