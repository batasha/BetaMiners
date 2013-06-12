class Question < ActiveRecord::Base
  attr_accessible :survey_id, :text

  belongs_to :survey
end