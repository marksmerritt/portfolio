FactoryBot.define do
  factory :notebook do
    name { "Notebook1" }
  end

  factory :second_notebook, class: Notebook do
    name { "Notebook2" }
  end
end
