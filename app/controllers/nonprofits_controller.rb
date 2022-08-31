class NonprofitsController < ApplicationController

  def index
  end

  def goods
    @nonprofits = Nonprofit.all
    @nonprofits = @nonprofits.where(goods_category_id: params[:goods_category_id]) if params[:goods_category_id]
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
    @nonprofit = Nonprofit.find(params[:id])
  end
end
