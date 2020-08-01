class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @rooms = @user.rooms

        #Displays all guest reviews for host (if user is host)
        @guest_reviews = Review.where(type: "GuestReview", host_id: @user.id)

         #Displays all host reviews for host (if user is guest)
        @host_reviews = Review.where(type: "HostReview", guest_id: @user.id)
    end
end