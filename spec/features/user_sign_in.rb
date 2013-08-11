require 'spec_helper'

feature "user sign in", js: true  do

  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }


  scenario "home page has sign in link" do
    visit root_path
    sleep 5
    expect {
      page.should have_content "sign in"
    }
  end

  scenario "question page has sign in link" do
    visit root_path
    visit question_path(question)
    expect {
      page.should have_link "sign in"
      page.should have_content "adadasdasd"
    }
  end

  # scenario "sign in link works on home page" do
  #   click_link "sign in"
  #   expect {
  #     page.should have_content "Sign In!"
  #     current_path.should == new_session_path
  #   }
  # end

  # scenario "sign in link works on questions page" do
  #   visit "/questions/1"
  #   click_link "sign in"
  #   expect {
  #     page.should have_content "Sign In!"
  #     current_path.should == new_session_path
  #   }
  # end

  # scenario "sign in page has a form" do
    
  #   visit new_session_path
  #   expect {
  #     page.should have_selector("form", action: "/sessions", method: "post")
  #   }
  # end

  # scenario "form has a email field" do
  #   visit new_session_path
  #   expect {
  #     page.should have_selector("label", for: "session_email")
  #     page.should have_selector("input", name: "session[email]", type: "text")
  #   }
  # end

  # scenario "form has a password field" do
  #   visit new_session_path
  #   expect {
  #     page.should have_selector("label", for: "session_password")
  #     page.should have_selector("input", name: "session[password]", type: "password")
  #   }
  # end

  # scenario "form has a submit button" do
  #   visit new_session_path
  #   expect {
  #     page.should have_selector("label", for: "session_email")
  #     page.should have_selector("input", name: "commit", type: "submit", value: "Sign In")
  #   }
  # end

  # scenario "submit button can be clicked" do
  #   visit new_session_path
  #   expect {
  #     click_button "Sign In"
  #   }
  # end

  # scenario "invalid credentials return an error" do
  #   visit new_session_path
  #   expect {
  #     fill_in "Email", with: "notavaliduser@email.com"
  #     fill_in "Password", with: "somepassword"
  #     click_button "Sign In"
  #     # flash[:error] == "Invalid user or email"
  #     page.should have_content "Invalid email or password"
  #     session[:user_id].should eq ""
  #   }
  # end

  # scenario "valid credentials create new session" do
  #   visit new_session_path
  #   expect {
  #     fill_in "Email", with: "test@test.com"
  #     fill_in "Password", with: "password"
  #     click_button "Sign In"
  #     session[:user_id].should_not eq ""
  #   }
  # end

  # scenario "sign in redirects to home page" do
  #   visit new_session_path
  #   expect {
  #     fill_in "Email", with: "test@test.com"
  #     fill_in "Password", with: "password"
  #     click_button "Sign In"
  #     current_path.should == root_path
  #   }
  # end
end
