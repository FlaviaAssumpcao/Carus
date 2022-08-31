class DonationsController < ApplicationController
  before_action :set_nonprofit, only: %i[new create]

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.nonprofit = @nonprofit
    @donation.user = current_user
    @donation.date = @donation.date + @donation.time.to_i.hours
    @donation.save!

    redirect_to nonprofit_path(@nonprofit)
  end

private

  def set_nonprofit
    @nonprofit = Nonprofit.find(params[:nonprofit_id])
  end

  def donation_params
    params.require(:donation)
      .permit(:date, :time, :goods_category_id, :time_category_id)
  end
end
