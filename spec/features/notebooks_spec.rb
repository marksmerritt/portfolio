require "rails_helper"

describe "navigation" do
  before do 
    @notebook1 = FactoryBot.create(:notebook)
    @notebook2 = FactoryBot.create(:second_notebook)
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
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

    it "displays associated notes" do 
      @note = FactoryBot.create(:note, notebook: @notebook1)
      visit notebook_path(@notebook1)
      expect(page).to have_content(@note.title)
    end
  end

  describe "new" do 
    it "can be created from a form" do 
      visit new_notebook_path
      fill_in "name-field", with: "Something"
      expect{ click_button("submit-btn") }.to change{ Notebook.count }.by(1)
    end
  end

  describe "edit" do 
    it "has an editable name" do 
      visit notebook_path(@notebook1)
      click_link "edit-notebook-#{@notebook1.name}"
      fill_in "name-field", with: "Something else"
      click_button "submit-btn"

      expect(@notebook1.reload.name).to eq("Something else")
    end
  end

  describe "toggle_status" do 
    it "can be toggled from the show page" do 
      visit notebook_path(@notebook1)
      click_link "toggle-notebook-#{@notebook1.id}-status"

      expect(@notebook1.reload.status).to eq("archived")
    end
  end
end




























