class CommentsController < ApplicationController

  def create
    @comments = Comment.create(id: comment_params[:id], user_id: current_user.id, prototype_id: comment_params[:prototype_id], captured_image_id: comment_params[:captured_image_id], text: comment_params[:text])
  end

  private
  def comment_params
  	params.permit(:id, :prototype_id, :captured_image_id, :text);
  end

end
