class CreateGoodsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :goods_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
