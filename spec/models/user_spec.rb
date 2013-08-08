# Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  
  let(:user) { FactoryGirl.build(:user) }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation)}

  describe "when email format is invalid" do
    it "should be invalid" do
      emails = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      emails.each do |invalid_email|
        user.email = invalid_email
        user.should be_invalid
      end
    end
  end

  describe "when email format is valid" do 
    it "should be valid" do
      emails = %w[user@foo.com A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      emails.each do |valid_email|
        user.email = valid_email
        user.should be_valid
      end
    end
  end

  describe "when password is not present" do
    let(:user) { user.password = user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    let(:user) { user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    let(:user) { user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    let(:user) { user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "when email address is not unique" do
    # let(:user) { user.dup }
    it "should not be valid" do
      user.save
      dup_user = user.dup
      dup_user.email = user.email.upcase
      dup_user.save
      dup_user.should_not be_valid
    end
  end
end
