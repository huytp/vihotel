class OfferController < ApplicationController
  def index
    @offers = Offer.all
    @slogan = eval(Slogan.last.content)[I18n.locale]
  end

  def show
    @offer = Offer.where(friendly: params[:friendly]).last
    @offers = Offer.all
  end
end
