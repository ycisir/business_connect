class CreateOffers < ActiveRecord::Migration[8.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :offer_type
      t.date :expires_at
      t.boolean :is_active, null: false, default: true
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
