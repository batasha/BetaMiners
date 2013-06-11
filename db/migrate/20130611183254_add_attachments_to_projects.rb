class AddAttachmentsToProjects < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.integer :project_id
      t.string :caption
    end
    add_index :screenshots, :project_id

    add_attachment :projects, :logo
    add_attachment :screenshots, :image
    add_attachment :users, :picture
  end
end
