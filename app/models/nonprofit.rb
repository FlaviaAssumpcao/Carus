class Nonprofit < ApplicationRecord
  has_many :donations
  has_many :time_categorizations
  has_many :goods_categorizations
  has_many :time_categories, through: :time_categorizations
  has_many :goods_categories, through: :goods_categorizations
end
