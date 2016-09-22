class ParentRoomTypesController < ApplicationController
  before_action :set_parent_room_type, only: [:show, :edit, :update, :destroy]

  # GET /parent_room_types
  # GET /parent_room_types.json
  def index
    @parent_room_types = ParentRoomType.all
  end

  # GET /parent_room_types/1
  # GET /parent_room_types/1.json
  def show
  end

  # GET /parent_room_types/new
  def new
    @parent_room_type = ParentRoomType.new
  end

  # GET /parent_room_types/1/edit
  def edit
  end

  # POST /parent_room_types
  # POST /parent_room_types.json
  def create
    @parent_room_type = ParentRoomType.new(parent_room_type_params)

    respond_to do |format|
      if @parent_room_type.save
        format.html { redirect_to @parent_room_type, notice: 'Parent room type was successfully created.' }
        format.json { render :show, status: :created, location: @parent_room_type }
      else
        format.html { render :new }
        format.json { render json: @parent_room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent_room_types/1
  # PATCH/PUT /parent_room_types/1.json
  def update
    respond_to do |format|
      if @parent_room_type.update(parent_room_type_params)
        format.html { redirect_to @parent_room_type, notice: 'Parent room type was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent_room_type }
      else
        format.html { render :edit }
        format.json { render json: @parent_room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent_room_types/1
  # DELETE /parent_room_types/1.json
  def destroy
    @parent_room_type.destroy
    respond_to do |format|
      format.html { redirect_to parent_room_types_url, notice: 'Parent room type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent_room_type
      @parent_room_type = ParentRoomType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_room_type_params
      params.require(:parent_room_type).permit(:name)
    end
end
