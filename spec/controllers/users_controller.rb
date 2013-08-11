require 'spec_helper'

describe UsersController do
  render_views

  let(:session) { session[:id] = create(:user) }
  let(:user) { create(:user) }

  describe '#new' do
    it "should respond to a get request to render the sign up form" do
    get :new
    expect(response.status).to eq 301
    end
  end

  describe 'create' do
    context "when a user signs up successfully" do

      before do
        post :create, user: { name: user.name, email: user.email, password: user.password, password_confirmation: user.password }
      end

      it 'should be treated as a current user with a session id' do
        expect {logged_in? == true }
      end
    end
  end

end
