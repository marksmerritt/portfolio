FactoryBot.define do
  factory :message do
    name { "John Doe" }
    email { "john@example.com" }
    body { "This is my message" }
  end
end
