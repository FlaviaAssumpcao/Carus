class FavoritesController < ApplicationController

  def toggle
    @nonprofit = Nonprofit.find(params[:nonprofit_id])

    # Check if current user has favorited this nonprofit
    favorite = Favorite.find_by(nonprofit: @nonprofit, user: current_user)

    if !favorite.nil?
      favorite.destroy

      redirect_to(request.env['HTTP_REFERER'])
    else
      @favorite = Favorite.new
      @favorite.nonprofit = @nonprofit
      @favorite.user = current_user

      @favorite.save
      
      redirect_to(request.env['HTTP_REFERER'])
    end
  end

end
