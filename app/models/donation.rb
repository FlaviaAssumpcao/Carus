class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :nonprofit
  belongs_to :goods_category, optional: true
  belongs_to :time_category, optional: true

  validates :date, presence: true
  validates :time, presence: true, on: :create

  after_validation :update_date_with_time, on: :create

  attribute :time, type: Integer

  def update_date_with_time
    return unless time.present?

    self.date = date + time.to_i.hours
  end
end
