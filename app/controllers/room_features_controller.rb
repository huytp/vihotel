class RoomFeaturesController < ApplicationController
  before_action :set_room_feature, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_resource
  authorize_resource
  # GET /room_features
  # GET /room_features.json
  def index
    @room_features = RoomFeature.all
  end

  # GET /room_features/1
  # GET /room_features/1.json
  def show
  end

  # GET /room_features/new
  def new
    @room_feature = RoomFeature.new
  end

  # GET /room_features/1/edit
  def edit
  end

  # POST /room_features
  # POST /room_features.json
  def create
    @room_feature = RoomFeature.new(room_feature_params)

    respond_to do |format|
      if @room_feature.save
        format.html { redirect_to @room_feature, notice: 'Room feature was successfully created.' }
        format.json { render :show, status: :created, location: @room_feature }
      else
        format.html { render :new }
        format.json { render json: @room_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_features/1
  # PATCH/PUT /room_features/1.json
  def update
    respond_to do |format|
      if @room_feature.update(room_feature_params)
        format.html { redirect_to @room_feature, notice: 'Room feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_feature }
      else
        format.html { render :edit }
        format.json { render json: @room_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_features/1
  # DELETE /room_features/1.json
  def destroy
    @room_feature.destroy
    respond_to do |format|
      format.html { redirect_to room_features_url, notice: 'Room feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_feature
      @room_feature = RoomFeature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_feature_params
      params.require(:room_feature).permit(:name)
    end
end
