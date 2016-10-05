class RoomTypesController < ApplicationController
  before_action :set_room_type, only: [:show, :edit, :update, :destroy]
  before_action :set_parent_room_type, only: [:new, :index, :show, :destroy]
  before_action :set_parent_room_type_create, only: :create
  before_action :set_parent_room_type_edit_update, only: [:edit, :update]

  # before_action :authenticate_user!
  # load_resource
  # authorize_resource

  def index
    @room_types = @parent_room_type.room_types.all
  end

  # GET /room_types/1
  # GET /room_types/1.json
  def show
  end

  # GET /room_types/new
  def new
    @room_type = @parent_room_type.room_types.new
  end

  # GET /room_types/1/edit
  def edit
  end

  # POST /room_types
  # POST /room_types.json
  def create
    @room_type = @parent_room_type.room_types.new(room_type_params)
    @room_type.friendly = @room_type.room_type_name.parameterize
    @room_type.room_features = params.require(:room_type).require(:room_features)
    respond_to do |format|
      if @room_type.save
        format.html { redirect_to parent_room_type_room_type_path(@parent_room_type, @room_type), notice: 'Room type was successfully created.' }
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

        @room_type.friendly = @room_type.room_type_name.parameterize
        @room_type.save
        format.html { redirect_to parent_room_type_room_type_path(@parent_room_type, @room_type), notice: 'Room type was successfully updated.' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_room_type
      @room_type = RoomType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_type_params
      params.require(:room_type).permit(:room_type_name, :description, :room_size, :room_bed, :room_view, :cost)
    end

    def set_parent_room_type
      @parent_room_type = ParentRoomType.find(params[:parent_room_type_id])
    end

    def set_parent_room_type_create
      @parent_room_type = ParentRoomType.find(params['room_type']['parent_room_type_id'])
    end

    def set_parent_room_type_edit_update
      @parent_room_type = @room_type.parent_room_type
    end
end
