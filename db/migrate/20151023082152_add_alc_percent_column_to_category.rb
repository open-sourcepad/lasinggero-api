class AddAlcPercentColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :alc_percent, :float
  end
end
