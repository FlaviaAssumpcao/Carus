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
    @goods_categories = GoodsCategory.all
  end

  def volunteer
    @nonprofits = Nonprofit.joins(:goods_categorizations)
        .where.not(time_categorizations: { time_category_id: nil})

    if params[:time_category].present?
      @nonprofits = @nonprofits.joins(:time_categorizations)
        .where(time_categorizations: { time_category_id: params[:time_category] })
    end

    @nonprofits = @nonprofits.where(city: params[:city]) if params[:city]
    @time_categories = TimeCategory.all
  end

  def show
    @nonprofits = Nonprofit.all
    @markers = @nonprofits.geocoded.map do | nonprofit |
      {
        lat: nonprofit.latitude,
        lng: nonprofit.longitude,
        info_window: render_to_string(partial: "info_window", locals: {nonprofit: nonprofit})
      }
    end

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
