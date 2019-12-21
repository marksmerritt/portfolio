require "faker"

# Reset
User.destroy_all
Note.destroy_all
Notebook.destroy_all


# Create User
User.create!(
  email: "mark@example.com",
  password: "helloworld"
)

puts "#{User.count} users created"


# Create Notebooks
notebooks = ["Rails", "Ruby", "JS", "Java"]

notebooks.each do |notebook|
  Notebook.create!(
    name: notebook
  )
end

@notebooks = Notebook.all
puts "#{Notebook.count} notebooks created"


# Create Notes
50.times do 
  Note.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    notebook: @notebooks.sample
  )
end

puts "#{Note.count} notes created"














