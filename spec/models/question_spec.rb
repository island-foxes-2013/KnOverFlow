# Schema Information
#
# Table name: questions
#
#  id                :integer
#  title             :string(255)
#  content           :string(255)
#  associated user   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Question do

  let(:user) { FactoryGirl.build(:user) }
  let(:question) { FactoryGirl.build(:question) }

  context "#new" do
    #it "allows mass-assignment on title and content" do
    it "should accept mass assignments for its title and content fields" do
      expect {
        question = Question.new(title: "Thing 1", content: "Things 2")
      }.not_to raise_error
    end

    it "should not allow mass-assignment on user" do
      expect {
        question = Question.new(title: "Thing 1", content: "Thing 2", user: user)
      }.to raise_error
      expect {
        question = Question.new(title: "Thing 1", content: "Thing 2", user_id: user.id)
      }.to raise_error
    end
  end
  
  context "#save" do
    #it "requires a valid user" do
    it "should be associated with a user before it can be saved" do
      expect(question).not_to be_valid
    end

    #it "requires a valid title" do
    it "should not save when title is blank" do
      question = FactoryGirl.build(:question, title: "", user: user)
      expect(question).not_to be_valid
    end

    #it "requires a valid content" do
    it "should not save when content is blank" do
      user = FactoryGirl.build(:user)
      question = FactoryGirl.build(:question, content: "", user: user)
      expect(question).not_to be_valid
    end
  end

end
