class ChangeNonprofitsMinTimeAndMaxTimeToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :nonprofits, :min_time
    remove_column :nonprofits, :max_time

    add_column :nonprofits, :min_time, :integer, default: 9
    add_column :nonprofits, :max_time, :integer, default: 18
  end
end
