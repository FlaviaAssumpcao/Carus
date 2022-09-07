class FavoritesController < ApplicationController

  def create
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
    @favorite = Favorite.new
    @favorite.nonprofit = @nonprofit
    @favorite.user = current_user
    if @favorite.save
      redirect_to(request.env['HTTP_REFERER'])
      # redirect_to nonprofit_path(@nonprofit)
    else
      render plain: "This nonprofit is already in your favorites."
    end
  end
end
