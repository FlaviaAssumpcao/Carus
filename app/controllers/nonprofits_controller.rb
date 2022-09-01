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
    if @nonprofit.goods_categories != nil
      @goods_categories = @nonprofit.goods_categories
    end
    if @nonprofit.time_categories != nil
      @time_categories = @nonprofit.time_categories
    end
  end

  private

  def set_nonprofit
    @nonprofit = Nonprofit.find(params[:id])
  end


end
