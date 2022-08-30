class CreateGoodsCategorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :goods_categorizations do |t|
      t.references :nonprofit, null: false, foreign_key: true
      t.references :goods_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
