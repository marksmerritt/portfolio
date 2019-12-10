require "rails_helper"

describe "navigation" do
  describe "index" do 
    before do 
      @notebook1 = FactoryBot.create(:notebook)
      @notebook2 = FactoryBot.create(:second_notebook)
    end

    it "displays a list of notebooks" do 
      visit notebooks_path
      expect(page).to have_content(/#{@notebook1.name}|#{@notebook2.name}/)
    end
  end  
end