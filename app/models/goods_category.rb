class GoodsCategory < ApplicationRecord
  has_many :goods_categorizations
  has_many :nonprofits, through: :goods_categorizations
  has_many :donations, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
