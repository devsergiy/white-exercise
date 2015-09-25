FactoryGirl.define do
  factory :group_event do
    name "MyString"
    description "MyText"
    location "MyString"
    start_at "2015-09-24 16:35:06"
    end_at "2015-09-25 16:35:06"
    status :draft
    duration 1

    trait :incomplete do
      name nil
      description nil
    end

    trait :published do
      status :published
    end

    trait :removed do
      removed true
    end

    factory :incomplete_event, traits: [:incomplete]
    factory :published_event,  traits: [:published]
    factory :removed_event,    traits: [:removed]
    factory :invalid_event,    traits: [:incomplete, :published]
  end
end
