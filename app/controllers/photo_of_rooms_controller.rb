class PhotoOfRoomsController < ApplicationController
  before_action :set_photo_of_room, only: [:show, :edit, :update, :destroy]
  before_action :set_room_type, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_resource
  authorize_resource
  # GET /photo_of_rooms
  # GET /photo_of_rooms.json
  def index
    @photo_of_rooms = @room_type.photo_of_rooms.all
  end

  # GET /photo_of_rooms/1
  # GET /photo_of_rooms/1.json
  def show
  end

  # GET /photo_of_rooms/new
  def new
    @photo_of_room = @room_type.photo_of_rooms.new
  end

  # GET /photo_of_rooms/1/edit
  def edit
  end

  # POST /photo_of_rooms
  # POST /photo_of_rooms.json
  def create
    @photo_of_room = @room_type.photo_of_rooms.new(photo_of_room_params_new)

    respond_to do |format|
      if @photo_of_room.save
        format.html { redirect_to  room_type_photo_of_room_path(@room_type, @photo_of_room), notice: 'Photo of room was successfully created.' }
        format.json { render :show, status: :created, location: @photo_of_room }
      else
        format.html { render :new }
        format.json { render json: @photo_of_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_of_rooms/1
  # PATCH/PUT /photo_of_rooms/1.json
  def update
    respond_to do |format|
      if @photo_of_room.update(photo_of_room_params_new)
        format.html { redirect_to room_type_photo_of_room_path(@room_type, @photo_of_room), notice: 'Photo of room was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_of_room }
      else
        format.html { render :edit }
        format.json { render json: @photo_of_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_of_rooms/1
  # DELETE /photo_of_rooms/1.json
  def destroy
    @photo_of_room.destroy
    respond_to do |format|
      format.html { redirect_to room_type_photo_of_rooms_path(@room_type), notice: 'Photo of room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_photo_of_room
      @photo_of_room = PhotoOfRoom.find(params[:id])
    end

    def photo_of_room_params_new
      params.require("/room_types/#{params[:room_type_id]}/photo_of_rooms/new").permit(:image)
    end

    def set_room_type
      @room_type = RoomType.find(params[:room_type_id])
    end
end
