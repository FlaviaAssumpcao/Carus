class RemoveNullFalseFromDonationsCategories < ActiveRecord::Migration[7.0]
  def change
    change_column :donations, :goods_category_id, :bigint, foreign_key: true, null: true
    change_column :donations, :time_category_id, :bigint, foreign_key: true, null: true
  end
end
