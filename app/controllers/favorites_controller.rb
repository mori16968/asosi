class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
    redirect_back(fallback_location: root_url)
  end

  def destroy
    favorite = Favorite.find_by(params[:id])
    favorite.destroy
    redirect_back(fallback_location: root_url)
  end
end
