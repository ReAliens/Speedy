class CreateReserveds < ActiveRecord::Migration[7.0]
  def change
    create_table :reserveds do |t|
      t.string :name
      t.string :city
      t.date :started_at
      t.date :ended_at
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
