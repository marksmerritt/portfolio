require "rails_helper"

describe "contact" do 
  before do 
    visit root_path
    click_button "contact-btn"
  end

  it "can be accessed from the navbar" do 
    expect(page).to have_css("#contact-form")
  end

  it "can be submitted" do 
    fill_in "name-field", with: "John Doe"
    fill_in "email-field", with: "john@example.com"
    fill_in "body-field", with: "This is a message"
    expect{ click_button("contact-submit") }.to change{ Message.count }.by(1)
  end
end