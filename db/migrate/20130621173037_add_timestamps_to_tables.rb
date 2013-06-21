class AddTimestampsToTables < ActiveRecord::Migration
  def change
    drop_table :platforms

    add_column :profiles, :created_at, :datetime
    add_column :profiles, :updated_at, :datetime

    add_column :projects, :created_at, :datetime
    add_column :projects, :updated_at, :datetime

    add_column :screenshots, :created_at, :datetime
    add_column :screenshots, :updated_at, :datetime

    add_column :test_phases, :created_at, :datetime
    add_column :test_phases, :updated_at, :datetime

    add_column :surveys, :created_at, :datetime
    add_column :surveys, :updated_at, :datetime

    add_column :questions, :created_at, :datetime
    add_column :questions, :updated_at, :datetime

    add_column :responses, :created_at, :datetime
    add_column :responses, :updated_at, :datetime

    add_column :registrations, :created_at, :datetime
    add_column :registrations, :updated_at, :datetime

    add_column :feedbacks, :created_at, :datetime
    add_column :feedbacks, :updated_at, :datetime

    add_column :choices, :created_at, :datetime
    add_column :choices, :updated_at, :datetime
  end
end
