require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:message) }.to change{ Message.count }.by(1)
    end
  end

  describe "validation" do 
    let(:message) { FactoryBot.build_stubbed(:message) }

    it "has a name" do 
      message.name = nil
      expect(message).to_not be_valid
    end

    it "has a email" do 
      message.email = nil
      expect(message).to_not be_valid
    end

    it "has a body" do 
      message.body = nil
      expect(message).to_not be_valid
    end
  end
end
