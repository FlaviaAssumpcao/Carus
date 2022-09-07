class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :nonprofit

  validates :user, uniqueness: { scope: :nonprofit }
end
