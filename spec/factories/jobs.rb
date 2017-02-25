FactoryGirl.define do
  factory :job, class: Job do
    title "Yard Worker"
    description "You will work on my yard.  No payment at all"
    job_status 0
  end
end
