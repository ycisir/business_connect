class CreateBusinesses < ActiveRecord::Migration[8.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :whatsapp
      t.boolean :featured, null: false, default: true
      t.string :website
      t.string :instagram
      t.string :facebook
      t.string :google_maps
      t.string :phone
      t.text :search_keywords
      t.references :area, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :businesses, :slug, unique: true
  end
end
