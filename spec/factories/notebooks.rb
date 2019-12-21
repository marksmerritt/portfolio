FactoryBot.define do
  factory :notebook do
    name { "Notebook1" }
  end

  factory :second_notebook, class: Notebook do
    name { "Notebook2" }
  end

  factory :active_notebook, class: Notebook do
    name { "Active Notebook" }
    status { "active" }
  end

  factory :archived_notebook, class: Notebook do
    name { "Archived Notebook" }
    status { "archived" }
  end
end
