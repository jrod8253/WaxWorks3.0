class FavoritesController < ApplicationController
    def index
        @favorites = Favorite.all

    end

    def create
        @favorite = Favorite.new
        @favorite.user = current_user
        @favorite.release = Release.find(params[:release_id])

        if favorite_already_exists?
          redirect_to listings_path, notice: "Release already in favorites."
        elsif @favorite.save
          redirect_to listings_path, notice: "Release added to favorites list"
        else
          render :index, status: :unprocessable_entity
        end
    end

    def update
    end

    private

    def favorite_already_exists?
      Favorite.exists?(user: current_user, release_id: @favorite.release_id)
    end
end
