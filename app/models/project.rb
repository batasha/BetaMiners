class Project < ActiveRecord::Base
  attr_accessible :name, :url, :category, :description, :private, :user_id,
                  :logo, :screenshots

  belongs_to :user
  has_many :screenshots

  has_attached_file :logo, styles: {large: "100x100>", thumb: "50x50>"},
                    default_url: "public/missing.png"
end