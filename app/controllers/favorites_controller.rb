class FavoritesController < ApplicationController

  def create
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @favorite = Favorite.new
    @favorite.nonprofit = @nonprofit
    @favorite.user = current_user
    if @favorite.save
      redirect_to nonprofit_path(@nonprofit)
    else
      render "nonprofits#show"
    end
  end
end
