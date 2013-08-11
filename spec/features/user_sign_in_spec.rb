require 'spec_helper'

feature "user sign in"  do

  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }

  scenario "home page has sign in link" do
    visit root_path
    page.should have_link "sign in"
  end

  scenario "question page has sign in link" do
    visit question_path(question)
    page.should have_link "sign in"
  end

  scenario "sign in link works on home page" do
    visit root_path
    click_link "sign in"
    page.should have_content "Sign In!"
    current_path.should == new_session_path
  end

  scenario "sign in link works on questions page" do
    visit question_path(question)
    click_link "sign in"
    page.should have_content "Sign In!"
    current_path.should == new_session_path
  end

  scenario "sign in page has a form" do
    visit new_session_path
    page.should have_selector("form")
  end

  scenario "invalid credentials return an error" do
    visit new_session_path
    fill_in "Email", with: "notavaliduser@email.com"
    fill_in "Password", with: "somepassword"
    click_button "Sign In"
    page.should have_content "Invalid email or password"
  end

  scenario "sign in redirects to home page" do
    visit new_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    # current_path.should eq root_path
    page.should have_content "these are all the questions"
  end
end
