class Nonprofit < ApplicationRecord
  has_many :donations
  has_many :time_categorizations
  has_many :goods_categorizations
  has_many :time_categories, through: :time_categorizations
  has_many :goods_categories, through: :goods_categorizations

  validates :name, :brief_description, :full_description, :address, :phone, :city, :email, :min_time, :max_time, presence: true
  validates :name, :email, :phone, uniqueness: true

  validates :min_time, comparison: { less_than: :max_time }
end
