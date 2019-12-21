require "rails_helper"

describe "navigation" do 
  describe "index" do
    before do 
      @user = FactoryBot.create(:user)
      login_as(@user, scope: :user)
      @note = FactoryBot.create(:note)
      @second_note = FactoryBot.create(:second_note)
    end

    it "displays a list of notes" do 
      visit notes_path
      expect(page).to have_content(/#{@note.title}|#{@second_note.title}/)
    end
  end
end