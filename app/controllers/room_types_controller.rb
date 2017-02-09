class RoomTypesController < ApplicationController
  before_action :set_room_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_resource
  authorize_resource

  def index
    @room_types = RoomType.all
  end

  # GET /room_types/1
  # GET /room_types/1.json
  def show
    @currency = Currency.last.currency
  end

  # GET /room_types/new
  def new
    @room_type = RoomType.new
  end

  # GET /room_types/1/edit
  def edit
  end

  # POST /room_types
  # POST /room_types.json
  def create
    @room_type = RoomType.new(room_type_params)
    @room_type.description = description_params
    @room_type.friendly = @room_type.room_type_name.parameterize
    @room_type.room_features = params.require(:room_type).require(:room_features)
    respond_to do |format|
      if @room_type.save
        format.html { redirect_to room_type_path(@room_type), notice: 'Room type was successfully created.' }
        format.json { render :show, status: :created, location: @room_type }
      else
        format.html { render :new }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_types/1
  # PATCH/PUT /room_types/1.json
  def update
    respond_to do |format|
      if @room_type.update(room_type_params)
        @room_type.room_features = params.require(:room_type).require(:room_features)
        @room_type.description = description_params
        @room_type.friendly = @room_type.room_type_name.parameterize
        @room_type.save
        format.html { redirect_to room_type_path(@room_type), notice: 'Room type was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_type }
      else
        format.html { render :edit }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_types/1
  # DELETE /room_types/1.json
  def destroy
    @room_type.destroy
    respond_to do |format|
      format.html { redirect_to room_types_url, notice: 'Room type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def description_params
      "{vi: '#{params[:description_vi]}', en: '#{params[:description_en]}'}"
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_room_type
      @room_type = RoomType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_type_params
      params.require(:room_type).permit(:room_type_name, :room_size, :room_count, :room_view, :cost)
    end

end
