# Schema Information
#
# Table name: comments
#
# t.text     "content"
# t.integer  "user_id"
# t.integer  "commentable_id"
# t.string   "commentable_type"
# t.datetime "created_at",       :null => false
# t.datetime "updated_at",       :null => false
#

require 'spec_helper'

describe Vote do

  let(:user) { FactoryGirl.build(:user) }
  let(:question) { FactoryGirl.build(:question) }
  let(:answer) { FactoryGirl.build(:answer) }
  
  context "#new" do
    it "should allow mass-assignment on vote" do
      expect {
        vote = Vote.new(vote: 1)
      }.to_not raise_error
    end

    it "should not allow mass-assignment on user" do
      expect {
        vote = Vote.new(user: user)
      }.to raise_error
      expect {
        vote = Vote.new(user_id: user.id)
      }.to raise_error
    end

    it "should not allow mass-assignment on votable_id" do
      expect {
        vote = Vote.new(question: question)
      }.to raise_error
      expect {
        vote = Vote.new(question_id: question.id)
      }.to raise_error
      expect {
        vote = Vote.new(answer: answer)
      }.to raise_error
      expect {
        vote = Vote.new(answer_id: answer.id)
      }.to raise_error
    end

    it "should not allow mass-assignment on votable_type" do
      expect {
        vote = Vote.new(votable_type: "any value")
      }.to raise_error
    end
  end

  context "#save" do
    it "requires a valid user" do
      vote = FactoryGirl.build(:vote, vote: 0, voteable_id: question)
      expect(vote).not_to be_valid
    end

    # There is no voteable_type test because AR automatically populates the type
    # when an valid ID is passed to the voteable_id attribute
    # #ActiveRecordMagic
    it "requires a valid voteable_id" do
      vote = FactoryGirl.build(:vote, vote: 1, user: user, voteable_id: 1)
      expect(vote).not_to be_valid
    end

    it "requires a valid vote" do
      vote = FactoryGirl.build(:vote, user: user, voteable_id: answer)
      expect(comment).not_to be_valid
    end
  end
end
