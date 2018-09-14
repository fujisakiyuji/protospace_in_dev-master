class CommentsController < ApplicationController

  def create
    Comment.create(text:params[:text],prototype_id:params[:prototype_id],user_id:current_user.id)
    redirect_to "/prototypes/#{params[:prototype_id]}"
  end
end


