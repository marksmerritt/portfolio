require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:user) }.to change{ User.count }.by(1)
    end
  end
end
