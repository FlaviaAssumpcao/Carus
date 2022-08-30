class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :nonprofit
  belongs_to :goods_category
  belongs_to :time_category

  validates :date, presence: true
end
