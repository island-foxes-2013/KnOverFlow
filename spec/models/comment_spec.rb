# Schema Information
#
# Table name: answers
#
# t.text     "content"
# t.integer  "user_id"
# t.integer  "question_id"
# t.datetime "created_at",  :null => false
# t.datetime "updated_at",  :null => false
#

require 'spec_helper'

describe Answer do

  let(:user) { FactoryGirl.build(:user) }
  let(:question) { FactoryGirl.build(:question) }
  let(:answer) { FactoryGirl.build(:answer) }
  
  context "#new" do
    it "should allow mass-assignment on content" do
      expect {
        answer = Answer.new(content: "Blazzie-blah")
      }.to_not raise_error
    end

    it "should not allow mass-assignment on user" do
      expect {
        answer = Answer.new(user: user)
      }.to raise_error
      expect {
        answer = Answer.new(user_id: user.id)
      }.to raise_error
    end

    it "should not allow mass-assignment on question" do
      expect {
        answer = Answer.new(question: question)
      }.to raise_error
      expect {
        answer = Answer.new(question_id: question.id)
      }.to raise_error
    end
  end

  context "#save" do
    it "requires a valid user" do
      answer = FactoryGirl.build(:answer, content: "DO A BARREL ROLE", question: question)
      expect(answer).not_to be_valid
    end

    it "requires a valid question" do
      answer = FactoryGirl.build(:answer, content: "DO A BARREL ROLE", user: user)
      expect(answer).not_to be_valid
    end

    it "requires a valid content" do
      answer = FactoryGirl.build(:answer, content: "", question: question, user: user)
      expect(answer).not_to be_valid
    end
  end
end
