class HotelOverviewsController < ApplicationController
  before_action :set_hotel_overview, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_resource
  authorize_resource
  # GET /hotel_overviews
  # GET /hotel_overviews.json
  def index
    @hotel_overviews = HotelOverview.all
  end

  # GET /hotel_overviews/1
  # GET /hotel_overviews/1.json
  def show
  end

  # GET /hotel_overviews/new
  def new
    @hotel_overview = HotelOverview.new
  end

  # GET /hotel_overviews/1/edit
  def edit
  end

  # POST /hotel_overviews
  # POST /hotel_overviews.json
  def create
    @hotel_overview = HotelOverview.new(hotel_overview_params)
    @hotel_overview.post_type = params[:type]
    respond_to do |format|
      if @hotel_overview.save
        format.html { redirect_to @hotel_overview, notice: 'Hotel overview was successfully created.' }
        format.json { render :show, status: :created, location: @hotel_overview }
      else
        format.html { render :new }
        format.json { render json: @hotel_overview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotel_overviews/1
  # PATCH/PUT /hotel_overviews/1.json
  def update
    @hotel_overview.post_type = params[:type]
    @hotel_overview.title = params_title
    @hotel_overview.content = params_content
    respond_to do |format|
      if @hotel_overview.save

        format.html { redirect_to @hotel_overview, notice: 'Hotel overview was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel_overview }
      else
        format.html { render :edit }
        format.json { render json: @hotel_overview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_overviews/1
  # DELETE /hotel_overviews/1.json
  def destroy
    @hotel_overview.destroy
    respond_to do |format|
      format.html { redirect_to hotel_overviews_url, notice: 'Hotel overview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_overview
      @hotel_overview = HotelOverview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def params_title
      "{vi: '#{params[:title_vi]}', en: '#{params[:title_en]}'}"
    end
    def params_content
      "{vi: '#{params[:content_vi]}', en: '#{params[:content_en]}'}"
    end
end
