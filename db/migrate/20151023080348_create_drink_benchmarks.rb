class CreateDrinkBenchmarks < ActiveRecord::Migration
  def change
    create_table :drink_benchmarks do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :drink, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
