class AddPlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :os
      t.string :browser
      t.string :version
    end
  end
end
