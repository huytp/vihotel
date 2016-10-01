class OfferController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.where(friendly: params[:friendly]).last
    @offers = Offer.all
  end
end
