require 'spec_helper'

feature "user sign up" do
  
  before do
    visit root_url
  end

  let(:user) { create(:user) }

  subject { page }

  it { should have_link ("sign up") }

  scenario "the sign up link takes the user to sign up page" do
    click_link("sign up")
    expect(current_path).to eq new_user_path
  end

  scenario "the user can fill in the sign up page" do
    visit new_user_path
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button 'Sign Up'
  end

  scenario "user should be logged in after they sign up" do
    log_in(user)
    expect(page).to have_content { user.name }
  end

  scenario "when user signs up with a bad password" do
    visit new_user_path
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: "1"
    fill_in "Password confirmation", with: "1"
    click_button 'Sign Up'
    expect(current_path).to eq users_path
  end

  scenario "when user does not fill in sign up form" do
    visit new_user_path
    click_button 'Sign Up'
    expect(current_path).to eq users_path
  end

  scenario "when user signs up without an email" do
    visit new_user_path
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button 'Sign Up'
    expect(current_path).to eq users_path
  end

  scenario "when user signs up without a name" do
    visit new_user_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button 'Sign Up'
    expect(current_path).to eq users_path
  end

  scenario "when user signs up without matching passwords" do
    visit new_user_path
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password + "1"
    click_button 'Sign Up'
    expect(current_path).to eq users_path
  end
end

