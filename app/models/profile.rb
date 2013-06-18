class Profile < ActiveRecord::Base
  attr_accessible :user_id, :birthday, :gender, :location

  belongs_to :user, inverse_of: :profile

  validates :gender, inclusion: {in: ["male", "female"]}
end