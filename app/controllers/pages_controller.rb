class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_account
    @donations = Donation.where(user: current_user)

    @favorites = Favorite.where(user: current_user)
  end

end
