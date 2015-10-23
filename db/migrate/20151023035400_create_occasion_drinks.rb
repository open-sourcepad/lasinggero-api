class CreateOccasionDrinks < ActiveRecord::Migration
  def change
    create_table :occasion_drinks do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :drink, index: true, foreign_key: true
      t.belongs_to :occasion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
