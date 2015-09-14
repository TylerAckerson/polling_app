# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  responder_id     :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base
  validates :answer_choice_id, presence: true
  validates :responder_id, presence: true
  validate :respondent_has_not_already_responded
  validate :respondend_is_not_poll_author

  belongs_to :respondent,
    class_name: "User",
    foreign_key: :responder_id,
    primary_key: :id

  belongs_to :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  def sibling_responses
    question.responses.where(":id IS NULL OR responses.id != :id", id: id)
  end

  private
  def respondent_has_not_already_responded
    if sibling_responses.exists?(responder_id: responder_id)
      errors[:respondent] << "respondent already answered question"
    end
  end

  def respondend_is_not_poll_author
    if respondent == question.author
      errors[:poll_author] << "author cannot respond to own poll"
    end
  end

end
