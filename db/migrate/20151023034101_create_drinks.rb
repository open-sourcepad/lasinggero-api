class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string     :name
      t.belongs_to :category, index: true
      t.float      :alc_percent
      t.float      :serving
      t.string     :serving_type

      t.timestamps null: false
    end
  end
end
