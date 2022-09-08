class NonprofitsController < ApplicationController
  before_action :set_nonprofit, only: [:show]

  def goods
    @nonprofits = Nonprofit.joins(:goods_categorizations)
    .where.not(goods_categorizations: { goods_category_id: nil})
    if params[:goods_category].present?
      @nonprofits = @nonprofits.joins(:goods_categorizations)
      .where(goods_categorizations: { goods_category_id: params[:goods_category] })
    end
    @nonprofits = @nonprofits.where(city: params[:city]) if params[:city]
    @goods_categories = GoodsCategory.where.not(name: "Multiple categories")

    @markers = @nonprofits.geocoded.map do |nonprofit|
      @markers =
        {
          lat: nonprofit.latitude,
          lng: nonprofit.longitude,
          info_window: render_to_string(partial: "info_window", locals: {nonprofit: nonprofit})
        }
    end
    @favorites = Favorite.where(user: current_user)
    #also possible: @favorites = current_user.favorites
  end

  def volunteer
    @nonprofits = Nonprofit.joins(:time_categorizations)
        .where.not(time_categorizations: { time_category_id: nil})

    if params[:time_category].present?
      @nonprofits = @nonprofits.joins(:time_categorizations)
        .where(time_categorizations: { time_category_id: params[:time_category] })
    end

    @nonprofits = @nonprofits.where(city: params[:city]) if params[:city]
    @time_categories = TimeCategory.where.not(name: "Multiple categories")

    @markers = @nonprofits.geocoded.map do |nonprofit|
      @markers =
        {
          lat: nonprofit.latitude,
          lng: nonprofit.longitude,
          info_window: render_to_string(partial: "info_window", locals: {nonprofit: nonprofit})
        }
    end
  end

  def show
    @markers = [
       {
         lat: @nonprofit.latitude,
         lng: @nonprofit.longitude,
       }]


    if @nonprofit.goods_categories.present?
      @goods_categories = @nonprofit.goods_categories
    end

    if @nonprofit.time_categories.present?
      @time_categories = @nonprofit.time_categories
    end
  end

  private

  def set_nonprofit
    @nonprofit = Nonprofit.find(params[:id])
  end

end
