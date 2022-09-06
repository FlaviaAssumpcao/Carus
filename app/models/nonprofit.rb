class Nonprofit < ApplicationRecord
  has_many :donations, dependent: :destroy
  has_many :time_categorizations
  has_many :goods_categorizations
  has_many :time_categories, through: :time_categorizations
  has_many :goods_categories, through: :goods_categorizations
  has_many :favorites, dependent: :destroy
  has_many_attached :photos
  has_one_attached :logo

  validates :name, :brief_description, :full_description, :address, :phone, :city, :email, :min_time, :max_time, presence: true
  validates :name, :email, :phone, uniqueness: true

  validates :min_time, comparison: { less_than: :max_time }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
