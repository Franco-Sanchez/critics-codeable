class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :summary
      t.date :released_date
      t.integer :category
      t.decimal :rating
      t.references :parent, foreign_key: { to_table: :games }

      t.timestamps
    end
  end
end
