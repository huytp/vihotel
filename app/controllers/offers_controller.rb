class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_authorization
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(params_image)
    @offer.title = params_title
    @offer.summary = params_summary
    @offer.content = params_content
    @offer.friendly = eval(@offer.title)[:vi].parameterize
    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(params_image)
        @offer.title = params_title
        @offer.summary = params_summary
        @offer.content = params_content
        @offer.friendly = eval(@offer.title)[:vi].parameterize

        @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_authorization
      unless current_user.staff? || current_user.admin?
        redirect_to error_errors_path
      end
    end

    def set_offer
      @offer = Offer.find(params[:id])
    end

    def params_image
      params.require(:offer).permit(:image)
    end

    def params_title
      "{vi: '#{params[:title_vi]}', en: '#{params[:title_en]}'}"
    end

    def params_summary
      "{vi: '#{params[:summary_vi]}', en: '#{params[:summary_en]}'}"
    end

    def params_content
      "{vi: '#{params[:content_vi]}', en: '#{params[:content_en]}'}"
    end
end
