class CreateNonprofits < ActiveRecord::Migration[7.0]
  def change
    create_table :nonprofits do |t|
      t.string :name
      t.text :brief_description
      t.text :address
      t.string :phone
      t.string :city
      t.text :full_description
      t.string :email
      t.time :min_time
      t.time :max_time

      t.timestamps
    end
  end
end
