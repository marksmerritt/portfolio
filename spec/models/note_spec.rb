require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:note) }.to change{ Note.count }.by(1)
    end
  end

  describe "validation" do 
    let(:note) { FactoryBot.build_stubbed(:note) }

    it "has a title" do 
      note.title = nil
      expect(note).to_not be_valid
    end

    it "has a body" do 
      note.body = nil
      expect(note).to_not be_valid
    end
  end

  describe "attachments" do 
    it "allows a screenshot to be attached" do 
      file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
      expect{ FactoryBot.create(:note, screenshots: [file]) }.to change{ ActiveStorage::Attachment.count }.by(1)
    end
  end
end
