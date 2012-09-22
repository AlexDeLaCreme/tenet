class AddArchivedToCanons < ActiveRecord::Migration
  def change
    add_column :canons, :archived, :boolean, default: false
  end
end
