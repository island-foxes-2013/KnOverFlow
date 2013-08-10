require 'spec_helper'

feature "visitor or user lands on home page" do
  
  before(:each) do 
    visit questions_path
  end

  scenario "and reviews questions" do
    expect(page).to have_content('these are all the questions')
  end
end