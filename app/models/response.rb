class Response < ActiveRecord::Base
  attr_accessible :question_id, :text

  belongs_to :question
  has_one :survey, through: :question

  has_many :choices

  def count
    choices.count
  end
end