class PhotoOverviewsController < ApplicationController
  before_action :set_photo_overview, only: [:show, :edit, :update, :destroy]
  before_action :set_hotel_overview, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_resource
  authorize_resource
  # GET /photo_overviews
  # GET /photo_overviews.json
  def index
    @photo_overviews = @hotel_overview.photo_overviews.all
  end

  # GET /photo_overviews/1
  # GET /photo_overviews/1.json
  def show
  end

  # GET /photo_overviews/new
  def new
    @photo_overview = @hotel_overview.photo_overviews.new
  end

  # GET /photo_overviews/1/edit
  def edit
  end

  # POST /photo_overviews
  # POST /photo_overviews.json
  def create
    @photo_overview = @hotel_overview.photo_overviews.new(photo_overview_params_new)
    respond_to do |format|
      if @photo_overview.save
        format.html { redirect_to hotel_overview_photo_overviews_path(@hotel_overview), notice: 'Photo overview was successfully created.' }
        format.json { render :show, status: :created, location: @photo_overview }
      else
        format.html { render :new }
        format.json { render json: @photo_overview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_overviews/1
  # PATCH/PUT /photo_overviews/1.json
  def update
    respond_to do |format|
      if @photo_overview.update(photo_overview_params_edit)
        format.html { redirect_to hotel_overview_photo_overview_path(@hotel_overview, @photo_overview), notice: 'Photo overview was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_overview }
      else
        format.html { render :edit }
        format.json { render json: @photo_overview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_overviews/1
  # DELETE /photo_overviews/1.json
  def destroy
    @photo_overview.destroy
    respond_to do |format|
      format.html { redirect_to hotel_overview_photo_overviews_path(@hotel_overview), notice: 'Photo overview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_overview
      @photo_overview = PhotoOverview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_overview_params_new
      params.require("/hotel_overviews/#{params[:hotel_overview_id]}/photo_overviews/new").permit(:image)
    end

    def photo_overview_params_edit
      params.require("/hotel_overviews/#{params[:hotel_overview_id]}/photo_overviews/#{params[:id]}").permit(:image)
    end

    def set_hotel_overview
      @hotel_overview = HotelOverview.find(params[:hotel_overview_id])
    end
end
