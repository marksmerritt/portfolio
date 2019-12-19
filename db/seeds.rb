# Reset
User.destroy_all
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

puts "#{Notebook.count} notebooks created"