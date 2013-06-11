class Project < ActiveRecord::Base
  attr_accessible :name, :url, :category, :description, :private, :user_id,
                  :logo, :screenshots, :screenshots_attributes

  belongs_to :user
  has_many :screenshots, dependent: :destroy
  accepts_nested_attributes_for :screenshots, reject_if: :all_blank

  has_attached_file :logo, styles: {large: "100x100>", thumb: "50x50>"},
                    default_url: "missing.png"
end