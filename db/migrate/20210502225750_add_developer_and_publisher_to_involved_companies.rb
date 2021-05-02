class AddDeveloperAndPublisherToInvolvedCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :involved_companies, :developer, :boolean
    add_column :involved_companies, :publisher, :boolean
  end
end
