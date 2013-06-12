class Survey < ActiveRecord::Base
  attr_accessible :test_phase_id

  belongs_to :test_phase
  has_one :project, through: :test_phase
  has_one :owner, through: :project, foreign_key: :user_id
end
