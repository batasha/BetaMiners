class Question < ActiveRecord::Base
  attr_accessible :survey_id, :text, :responses_attributes

  belongs_to :survey
  has_many :responses
  has_many :comments, through: :responses
  accepts_nested_attributes_for :responses, reject_if: :all_blank
end