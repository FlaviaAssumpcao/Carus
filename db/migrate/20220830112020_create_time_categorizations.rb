class CreateTimeCategorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :time_categorizations do |t|
      t.references :nonprofit, null: false, foreign_key: true
      t.references :time_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
