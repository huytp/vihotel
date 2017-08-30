class OfferController < ApplicationController
  def index
    @offers = Offer.all
    @slogan = Slogan.last.content_slogan
  end

  def show
    @offer = Offer.where(friendly: params[:friendly]).last
    @offers = Offer.all
  end
end
