class RemoveTypeFromInvolvedCompanies < ActiveRecord::Migration[6.1]
  def up
    remove_column :involved_companies, :type, :string
  end

  def down
    add_column :involved_companies, :type, :string
  end
end
