class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_account
    @past_donations = Donation.where(user: current_user, date: ..Date.today).order(date: :desc)
    @upcoming_donations = Donation.where(user: current_user, date: Date.today..).order(date: :asc)

    @favorites = Favorite.where(user: current_user)
  end
end
