# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def populate_users_table
	10.times do |user|
		User.create(name: Faker::Internet.user_name, email: Faker::Internet.email, password: '123456', password_confirmation: '123456')
	end
end
populate_users_table

def populate_questions
  user = User.all
  user.each do |user|
  	3.times do |question|
  		user.questions.create(title: Faker::Lorem.sentence(word_count = 4), content: Faker::Lorem.paragraphs(paragraph_count = 1))
  	end
  end
end
populate_questions


def populate_answers
	user_ids = []
	User.all.each do |user|
		user_ids << user.id 
	end
	questions = Question.all
	questions.each do |question|
		3.times do |answer|
			question.answers.create(content: Faker::Lorem.sentences(sentence_count = 3), user_id: user_ids.sample)
    end
  end
end
populate_answers

def populate_comments
	user_ids = []
	User.all.each do |user|
		user_ids << user.id 
	end
	questions = Question.all
	questions.each do |question|
		n = rand(0..7)
		n.times do |comments|
			question.comments.create(content: Faker::Lorem.sentences(sentence_count = 1), user_id: user_ids.sample)
    end
  end
  answers = Answer.all
	answers.each do |answer|
		n = rand(0..4)
		n.times do |comments|
			answer.comments.create(content: Faker::Lorem.sentences(sentence_count = 1), user_id: user_ids.sample)
    end
  end
end
populate_comments