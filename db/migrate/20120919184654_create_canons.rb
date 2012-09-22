class CreateCanons < ActiveRecord::Migration
  def change
    create_table :canons do |t|
      t.string :body

      t.timestamps
    end
  end
end
