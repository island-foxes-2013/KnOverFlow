require 'spec_helper'

describe ApplicationController do
  render_views

  let(:user) { create(:user) }
  let(:session) { session = user }

  describe "current user" do
    pending
  end

  describe 'logged in?' do
    pending
  end
end

