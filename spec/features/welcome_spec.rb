require "rails_helper"

describe "navigation" do 
  describe "index" do 
    it "is reachable" do 
      visit root_path
      expect(page).to have_content("Mark")
    end
  end
end