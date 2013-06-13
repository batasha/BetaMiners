class Choice < ActiveRecord::Base
  attr_accessible :feedback_id, :response_id, :comment

  belongs_to :feedback
  belongs_to :response
  has_one :user, through: :feedback
  has_one :question, through: :response
end