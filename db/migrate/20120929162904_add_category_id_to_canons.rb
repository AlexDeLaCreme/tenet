class AddCategoryIdToCanons < ActiveRecord::Migration
  def change
    add_column :canons, :category_id, :integer, default: nil
  end
end
