class Feedback < ActiveRecord::Base
  attr_accessible :survey_id, :user_id, :responses, :choices,
                  :response_ids, :choice_ids, :choices_attributes

  belongs_to :user
  belongs_to :survey
  has_one :test_phase, through: :survey
  has_one :project, through: :test_phase

  has_many :choices
  has_many :responses, through: :choices
  accepts_nested_attributes_for :choices

end