# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :body, presence: true
  validates :poll_id, presence: true

  belongs_to :poll,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id

  has_many :answer_choices,
    class_name: "AnswerChoice",
    foreign_key: :question_id,
    primary_key: :id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  has_one :author,
    through: :poll,
    source: :author
    
end
