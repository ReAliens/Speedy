class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.string :specs
      t.string :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
