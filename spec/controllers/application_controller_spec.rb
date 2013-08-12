require 'spec_helper'

describe ApplicationController do
  render_views


  describe "current user" do
    pending
    # user.send(current_user)
  end

  describe 'logged in?' do
    pending
    # user.send(current_user)
    # @controller = ApplicationController.new
    # @controller.instance_eval{ current_user }   # invoke the private method
    # @controller.instance_eval{ @current_user }.should be true
  end
end

