class ChangePrivateDefaultValueToFalse < ActiveRecord::Migration
  def change
    change_column :projects, :private, :boolean, default: false
  end
end
