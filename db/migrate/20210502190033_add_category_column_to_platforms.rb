class AddCategoryColumnToPlatforms < ActiveRecord::Migration[6.1]
  def change
    add_column :platforms, :category, :integer
  end
end
