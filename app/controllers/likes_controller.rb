class LikesController < ApplicationController
  def create
    @like = Like.create(prototype_id: like_params[:prototype_id], user_id: current_user.id)
    @count = Like.where(prototype_id: like_params[:prototype_id]).count
    respond_to do |format|
      format.json { render json: @count}
    end
  end

  def destroy
    @like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    @like.destroy
    @count = Like.where(prototype_id: params[:prototype_id]).count
    respond_to do |format|
      format.json { render json: @count}
    end
  end

  private
  def like_params
    params.permit(:prototype_id)
  end

end
