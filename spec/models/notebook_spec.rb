require 'rails_helper'

RSpec.describe Notebook, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:notebook) }.to change{ Notebook.count }.by(1)
    end
  end

  describe "validation" do 
    let(:notebook) { FactoryBot.build_stubbed(:notebook) }

    it "has a name" do 
      notebook.name = nil
      expect(notebook).to_not be_valid
    end
  end
end
