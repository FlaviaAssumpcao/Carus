class GoodsCategory < ApplicationRecord
  has_many :goods_categorizations
  has_many :nonprofits, through: :goods_categorizations
  has_many :donations

  validates :name, presence: true, uniqueness: true
end
