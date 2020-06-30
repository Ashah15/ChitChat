class CommentsController < ApplicationController
  before_action :comment_owner, only: [:destroy]
  before_action :logged_in_user

  def create
    @comment = current_user.comments.build(comments_params)
    @comment.author = current_user
    redirect_to comments_path if @comment.save
  end

  def index
    @comment = Comment.new
    @comments = Comment.all.where(author_id: current_user.id)
    #Comment.where("attribute = ? OR attribute2 = ?", author_id:, current_user.id)
    @users = User.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :image)
  end

  def comment_owner
    @comment = Comment.find(params[:id])
    redirect_to comments_path unless current_user == @comment.author
  end
end
