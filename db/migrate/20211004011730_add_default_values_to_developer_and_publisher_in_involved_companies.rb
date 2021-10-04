class AddDefaultValuesToDeveloperAndPublisherInInvolvedCompanies < ActiveRecord::Migration[6.1]
  def change
    change_column_default :involved_companies, :developer, false
    change_column_default :involved_companies, :publisher, false
  end
end
