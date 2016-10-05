class RoomFeaturesController < ApplicationController
  before_action :set_room_feature, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_authorization
  def index
    @room_features = RoomFeature.all
  end

  def show
  end

  def new
    @room_feature = RoomFeature.new
  end

  def edit
  end

  def create
    @room_feature = RoomFeature.new(name: room_feature_params)

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

  def update
    respond_to do |format|
      if @room_feature.update(name: room_feature_params)
        format.html { redirect_to @room_feature, notice: 'Room feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_feature }
      else
        format.html { render :edit }
        format.json { render json: @room_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room_feature.destroy
    respond_to do |format|
      format.html { redirect_to room_features_url, notice: 'Room feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_authorization
      unless current_user.staff? || current_user.admin?
        redirect_to error_errors_path
      end
    end

    def set_room_feature
      @room_feature = RoomFeature.find(params[:id])
    end

    def room_feature_params
      "{vi: '#{params[:name_vi]}', en: '#{params[:name_en]}'}"
    end
end
