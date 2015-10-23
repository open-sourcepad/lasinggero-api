class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title
      t.string :location

      t.timestamps null: false
    end
  end
end
