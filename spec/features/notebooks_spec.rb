require "rails_helper"

describe "navigation" do
  before do 
    @notebook1 = FactoryBot.create(:notebook)
    @notebook2 = FactoryBot.create(:second_notebook)
  end

  describe "index" do 
    it "displays a list of notebooks" do 
      visit notebooks_path
      expect(page).to have_content(/#{@notebook1.name}|#{@notebook2.name}/)
    end
  end  

  describe "show" do 
    it "is reachable from index" do 
      visit notebooks_path
      click_link "notebook-show-#{@notebook1.id}"
      expect(current_path).to eq(notebook_path(@notebook1))
    end
  end
end