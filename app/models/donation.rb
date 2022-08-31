class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :nonprofit
  belongs_to :goods_category, optional: true
  belongs_to :time_category, optional: true

  validates :date, presence: true

  attribute :time, type: Integer
end
