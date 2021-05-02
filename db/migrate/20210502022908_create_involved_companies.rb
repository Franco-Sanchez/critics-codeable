class CreateInvolvedCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :involved_companies do |t|
      t.references :company, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
