# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Seinfeld
elaine = User.create!(user_name: "Elaine")
jerry = User.create!(user_name: "Jerry")
kramer = User.create!(user_name: "Kramer")
george = User.create!(user_name: "George")

poll1 = Poll.create!(title: "Who here...", author_id: jerry.id)
poll2 = Poll.create!(title: "How come...", author_id: kramer.id)
poll3 = Poll.create!(title: "Have you ever...", author_id: elaine.id)

question1 = Question.create!(body: "What's the deal with airline food?" , poll_id: poll1.id)
question2 = Question.create!(body: "Why can't they?", poll_id: poll2.id)
question3 = Question.create!(body: "But...why?!?", poll_id: poll3.id)
question4 = Question.create!(body: "Would you think about it, though?", poll_id: poll3.id)
question5 = Question.create!(body: "But what's WRONG with that?",poll_id: poll3.id)

ac1 = AnswerChoice.create!(question_id: question1.id, body: "they're cuttin' corners")
ac2 = AnswerChoice.create!(question_id: question1.id, body: "UNDATEABLE")
ac3 = AnswerChoice.create!(question_id: question2.id, body: "alchohol?")
ac4 = AnswerChoice.create!(question_id: question2.id, body: "VanDalay industries")
ac5 = AnswerChoice.create!(question_id: question3.id, body: "cookies")
ac6 = AnswerChoice.create!(question_id: question3.id, body: "no soup for you")
ac7 = AnswerChoice.create!(question_id: question4.id, body: "they're the ones writing it off!")
ac8 = AnswerChoice.create!(question_id: question5.id, body: "JERRY!")

response1 = Response.create!(answer_choice_id: ac1.id, responder_id: elaine.id)
response2 = Response.create!(answer_choice_id: ac1.id, responder_id: kramer.id)
response3 = Response.create!(answer_choice_id: ac2.id, responder_id: george.id)
