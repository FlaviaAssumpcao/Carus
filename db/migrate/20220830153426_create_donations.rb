class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.references :nonprofit, null: false, foreign_key: true
      t.references :goods_category, null: false, foreign_key: true
      t.references :time_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
