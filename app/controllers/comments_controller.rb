class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to prototype_path(params[:prototype_id]) }
        format.json
      end
    end
  end

  private
  def comment_params
  	params.permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
