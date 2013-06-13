class Feedback < ActiveRecord::Base
  attr_accessible :survey_id, :user_id, :os, :browser, :version, :responses,
                  :choices, :response_ids, :choice_ids, :choices_attributes

  belongs_to :user
  belongs_to :survey
  has_one :test_phase, through: :survey
  has_one :project, through: :test_phase

  has_many :choices
  has_many :responses, through: :choices
  accepts_nested_attributes_for :choices

  def set_user_agent(agent)
    user_agent = UserAgent.parse(agent)

    self.os = user_agent.os
    self.browser = user_agent.browser
    self.version = user_agent.version.to_s
  end
end