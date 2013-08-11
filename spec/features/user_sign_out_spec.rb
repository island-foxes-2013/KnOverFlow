require 'spec_helper'

feature "user sign in"  do

  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }

  before(:each) do
    log_in(user)
  end

  scenario "home page has sign out link" do
    visit root_path
    page.should have_link "log out"
  end

  scenario "question page has sign out link" do
    visit question_path(question)
    page.should have_link "log out"
  end

  scenario "sign out link works on home page" do
    visit root_path
    click_link "log out"
    page.should have_content "sign in"
    page.should_not have_content user.name
    current_path.should eq root_path
  end

  scenario "sign out link works on questions page" do
    visit question_path(question)
    click_link "log out"
    page.should have_content "sign in"
    page.should_not have_content user.name
    current_path.should eq root_path
  end
end
