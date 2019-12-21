require "rails_helper"

describe "navigation" do 
  before do 
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
    @note = FactoryBot.create(:note)
    @second_note = FactoryBot.create(:second_note)
  end

  describe "index" do
    it "displays a list of notes" do 
      visit notes_path
      expect(page).to have_content(/#{@note.title}|#{@second_note.title}/)
    end
  end

  describe "show" do 
    it "displays note attributes" do 
      visit note_path(@note)
      expect(page).to have_content(/#{@note.title}|#{@note.body}/)
    end
  end

  describe "new" do 
    it "can be created from notebook show" do 
      visit notebook_path(@note.notebook)
      click_link "new-note"
      fill_in "title-field", with: "My new note"
      fill_in "body-field", with: "My new note body"

      expect{ click_button "submit-btn" }.to change{ Note.count }.by(1)
    end

    it "attaches an uploaded screenshot" do 
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
      expect{ FactoryBot.create(:note, screenshots: [file]) }.to change{ ActiveStorage::Attachment.count }.by(1)
    end
  end

  describe "edit" do 
    it "can be edited from show page" do 
      visit note_path(@note)
      click_link "edit-note-#{@note.id}"

      fill_in "title-field", with: "Some other title"
      fill_in "body-field", with: "Some other body"
      click_button "submit-btn"

      expect(@note.reload.body).to eq("Some other body")
    end
  end

  describe "destroy" do 
    it "can be destroyed from the show page" do 
      visit note_path(@note)

      expect{ click_link "delete-note-#{@note.id}" }.to change{ Note.count }.by(-1)
    end
  end

end
























