# Reset
Notebook.destroy_all

# Create Notebooks
notebooks = ["Rails", "Ruby", "JS", "Java"]

notebooks.each do |notebook|
  Notebook.create!(
    name: notebook
  )
end

puts "#{Notebook.count} notebooks created"