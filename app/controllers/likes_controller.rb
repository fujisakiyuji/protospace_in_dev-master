class LikesController < ApplicationController
  def create
    @prototypes = Prototype.new
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
  end

  def destroy
    @like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    @like.destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
  end

end
