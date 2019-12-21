FactoryBot.define do
  factory :note, class: Note do
    title { "My First Note" }
    body { "This is my first note" }
    association :notebook
  end

  factory :second_note, class: Note do
    title { "My Second Note" }
    body { "This is my second note" }
    association :notebook, factory: :second_notebook
  end
end
