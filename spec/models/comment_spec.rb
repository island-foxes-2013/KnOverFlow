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

describe Comment do

  let(:user) { FactoryGirl.build(:user) }
  let(:question) { FactoryGirl.build(:question) }
  let(:answer) { FactoryGirl.build(:answer) }
  let(:comment) { FactoryGirl.build(:comment) }
  
  context "#new" do
    it "should allow mass-assignment on content" do
      expect {
        comment = Comment.new(content: "Blazzie-blah")
      }.to_not raise_error
    end

    it "should not allow mass-assignment on user" do
      expect {
        comment = Comment.new(user: user)
      }.to raise_error
      expect {
        comment = Comment.new(user_id: user.id)
      }.to raise_error
    end

    it "should not allow mass-assignment on commentable_id" do
      expect {
        comment = Comment.new(question: question)
      }.to raise_error
      expect {
        comment = Comment.new(question_id: question.id)
      }.to raise_error
      expect {
        comment = Comment.new(answer: answer)
      }.to raise_error
      expect {
        comment = Comment.new(answer_id: answer.id)
      }.to raise_error
    end

    it "should not allow mass-assignment on commentable_type" do
      expect {
        comment = Comment.new(commentable_type: "any value")
      }.to raise_error
    end
  end

  context "#save" do
    it "requires a valid user" do
      comment = FactoryGirl.build(:comment, content: "DO A BARREL ROLE", commentable_id: question)
      expect(comment).not_to be_valid
    end

    # There is no commentable_type test because AR automatically populates the type
    # when an valid ID is passed to the commentable_id attribute
    # #ActiveRecordMagic
    it "requires a valid commentable_id" do
      comment = FactoryGirl.build(:comment, content: "DO A BARREL ROLE", user: user)
      expect(comment).not_to be_valid
    end

    it "requires a valid content" do
      comment = FactoryGirl.build(:comment, content: "", user: user, commentable_id: answer)
      expect(comment).not_to be_valid
    end
  end
end
