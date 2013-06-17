class Project < ActiveRecord::Base
  attr_accessible :name, :url, :category, :description, :private, :user_id,
                  :logo, :screenshots, :screenshots_attributes,
                  :test_phases_attributes

  belongs_to :user
  has_many :screenshots, dependent: :destroy
  accepts_nested_attributes_for :screenshots, reject_if: :all_blank

  has_many :test_phases
  accepts_nested_attributes_for :test_phases,
        reject_if: proc { |attributes| attributes['name'].blank?}

  has_many :registrations, dependent: :destroy
  has_many :testers, through: :registrations, class_name: "User"

  has_attached_file :logo, styles: {large: "100x100>", thumb: "50x50>"},
                    default_url: "missing.png"

  def active_test
    self.test_phases.order(:start_date).find do |test|
     test.status == "active" || test.status =="pending"
    end
  end

  def short_desc
    if description.length > 150
      description.gsub(/<[^>]+>|&[^;]+;/, '').slice(0, 150) + "..."
    else
      description.gsub(/<[^>]+>|&[^;]+;/, '')
    end
  end
end