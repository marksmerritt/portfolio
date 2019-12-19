FactoryBot.define do
  factory :note do
    title { "My First Note" }
    body { "This is my first note" }
    association :notebook
  end
end
