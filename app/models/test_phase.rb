class TestPhase < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date, :survey_attributes

  belongs_to :project
  has_one :owner, through: :project, foreign_key: :user_id
  has_one :survey
  accepts_nested_attributes_for :survey, reject_if: :all_blank

  def status
    if Date.today < start_date
      "pending"
    elsif Date.today >= start_date && Date.today <= end_date
      "active"
    else
      "complete"
    end
  end
end