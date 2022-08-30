class TimeCategory < ApplicationRecord
  has_many :time_categorizations
  has_many :nonprofits, through: :time_categorizations
  has_many :donations

  validates :name, presence: true, uniqueness: true
end
