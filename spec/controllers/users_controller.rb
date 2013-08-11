require 'spec_helper'

describe UsersController do
  render_views

  let(:user) { create(:user) }
  let(:session) { session = user.id }

  describe '#new' do
    it "should respond to a get request to render the sign up form" do
      get :new
      expect(response.status).to eq 301
    end
  end

  describe '#create' do
    
    context "when a user signs up successfully" do

      before do
        post :create, user: { name: user.name, email: user.email, password: user.password, password_confirmation: user.password }
      end

      it 'should be treated as a current user with a session id' do
        expect { logged_in? == true }
      end

      it 'should have a session id' do
        expect(session).to eq user.id
      end

      it 'redirects user to root path' do
        response.should redirect_to(root_path)
      end
    end

    context 'when a user is unsuccessful signing up' do

      before do
        current_user = nil
      end

      it 'should be treated as an unauthorized user' do
        expect { logged_in? == false }
      end

      # it 'should have a flash error' do
      #   flash[:error].should eq "Please try again"
      # end

      # it 'redirects to users_path' do
      #   response.should redirect_to(users_path)
      # end
    end
  end

end
