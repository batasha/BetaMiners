class Question < ActiveRecord::Base
  attr_accessible :survey_id, :text, :responses_attributes

  belongs_to :survey
  has_many :responses
  accepts_nested_attributes_for :responses, reject_if: :all_blank
  has_many :choices, through: :responses

  def choices_with_comments
    choices.select {|choice| choice.comment.presence}
  end
end