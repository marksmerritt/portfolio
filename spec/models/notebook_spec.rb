require 'rails_helper'

RSpec.describe Notebook, type: :model do
  describe "creation" do 
    it "can be created with valid attributes" do 
      expect{ FactoryBot.create(:notebook) }.to change{ Notebook.count }.by(1)
    end
  end

  describe "validation" do 
    let(:notebook) { FactoryBot.create(:notebook) }

    it "has a name" do 
      notebook.name = nil
      expect(notebook).to_not be_valid
    end

    it "has a unique name" do 
      @second_notebook = FactoryBot.build_stubbed(:second_notebook, name: notebook.name)
      expect(@second_notebook).to_not be_valid
    end
  end

  describe "#toggle_status!" do 
    it "toggles status from active to archived" do 
      @active_notebook = FactoryBot.create(:active_notebook)
      @active_notebook.toggle_status!

      expect(@active_notebook.reload.status).to eq("archived")
    end

    it "toggles status from archived to active" do 
      @archived_notebook = FactoryBot.create(:archived_notebook)
      @archived_notebook.toggle_status!

      expect(@archived_notebook.reload.status).to eq("active")
    end
  end
end
