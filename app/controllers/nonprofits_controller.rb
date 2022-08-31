class NonprofitsController < ApplicationController
   before_action :set_nonprofit, only: [:show]

   def goods
    @nonprofits = Nonprofit.all

    if params[:goods_category].present?
      @nonprofits = @nonprofits.joins(:goods_categorizations)
        .where(goods_categorizations: { goods_category_id: params[:goods_category] })
    end

    @nonprofits = @nonprofits.where(city: params[:city]) if params[:city]

    @goods_categories = GoodsCategory.all
  end

  def volunteer
    @nonprofits = Nonprofit.all
    @nonprofits = @nonprofits.where(goods_category_id: params[:time_category_id]) if params[:time_category_id]
    @nonprofits = @nonprofits.where(city: params[:city]) if params[:city]
    @time_categories = TimeCategory.all
  end

  def show

  end

  private

  def set_nonprofit
    @nonprofit = Nonprofit.find(params[:id])
  end


end
