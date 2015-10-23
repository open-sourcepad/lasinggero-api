class AddAmountColumnToOccasionDrinks < ActiveRecord::Migration
  def change
    add_column :occasion_drinks, :amount, :integer
  end
end
