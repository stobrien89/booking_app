class RoomsController < ApplicationController
  around_action :catch_not_found
  before_action :set_room, except: [:index, :new, :create, :delete_image_attachment]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorized, only: [:listing, :pricing, :description, :photo_upload, :amenities, :location, :update]
  

  def index
    
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: 'Your listing has been added!'
    else
      flash[:alert] = "Please make selections for all of the categories below."
      render :new
    end
  end

  def show
    @images = @room.images
    @guest_reviews = @room.guest_reviews
  end

  def listing
    
  end

  def pricing
    
  end

  def description
    
  end

  def photo_upload
    
  end

  def amenities
    
  end

  def location
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "Your changes have been saved."
    else
      flash[:alert] = "Something went wrong."
    end
    redirect_back(fallback_location: request.referer)
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: request.referer)
  end
  
  private
    def set_room
      @room = Room.find(params[:id])
    end

    def is_authorized
      redirect_to root_path, alert: "Access Denied" unless current_user.id == @room.user_id
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accomodates, :bedrooms, :bathrooms, :listing_name, :summary, :address, :tv, :kitchen, :air_conditioning, :heating, :internet, :price, :active, images: [])
    end

    def catch_not_found
      yield
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, alert: "Record not found"
    end
end
