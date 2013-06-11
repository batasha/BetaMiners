class Screenshot < ActiveRecord::Base
  attr_accessible :image, :project_id, :caption

  belongs_to :project

  has_attached_file :image, styles: {large: "720x405>", thumb: "160x90>"},
                    default_url: "public/missing.png"
end