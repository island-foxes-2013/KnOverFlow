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

  let(:user) { FactoryGirl.create(:user) }
  let(:question) { user.questions.create(content: "TEST", title: "TEST TITLE") }
  let(:vote) { user.votes.build(up_voted: true) }

  context "#new" do
      it "should allow mass-assignment on up_voted" do
        expect {
          Vote.new(up_voted: true)
        }.to_not raise_error
      end

      it "should not allow mass-assignment on user" do
        expect {
          Vote.new(user_id: user.id)
        }.to raise_error
      end

      it "should not allow mass-assignment on votable_id" do
        expect {
          Vote.new(voteable_id: question.id)
        }.to raise_error
      end

      it "should not allow mass-assignment on votable_type" do
        expect {
          Vote.new(votable_type: "any value")
        }.to raise_error
      end
    end

  context "#save" do

    it "requires a valid user" do
      expect(vote).not_to be_valid
    end

    # There is no voteable_type test because AR automatically populates the type
    # when an valid ID is passed to the voteable_id attribute
    # #ActiveRecordMagic
    it "requires a valid voteable_id" do
      expect(vote).not_to be_valid
    end

    it "requires a valid vote" do
      expect(vote).not_to be_valid
    end
  end

  context "#update_vote_count" do
    before do
      use_transactional_fixtures = false
    end

    it "should increment the vote_count if up_voted" do
        vote.voteable_type = question.class.name
        vote.voteable_id = question.id
        vote.save

        expect(vote.voteable.vote_count).to eq 1
    end

    it "should decrement the vote_count if up_voted = false" do
        vote.voteable_type = question.class.name
        vote.voteable_id = question.id
        vote.up_voted = false
        vote.save

        expect(vote.voteable.vote_count).to eq -1
    end
end

end
