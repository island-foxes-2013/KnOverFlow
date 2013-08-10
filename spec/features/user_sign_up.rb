require 'spec_helper'

feature "user sign up" do
  
  before do
    visit root_url
  end

  subject { page }

  it { should have_link ("sign up") }

  scenario "the sign up link takes the user to sign up page" do
    click_link("sign up")
    expect(current_path).to eq new_user_path
  end

  scenario "user should be logged in after they sign up" do
    pending
    # expect(:user).to be { log_in }
  end

  scenario "when user signs up with invalid information" do
    pending
  end
end

