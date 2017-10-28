class CommentsController < ApplicationController

  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @post = Post.find(params[:post_id])


    if @comment.save
      create_notification @comment
      flash[:success] = "Your comment was saved"
      redirect_to :back
    else
      flash[:alert] = "Check the comment form, something went horribally wrong."
      render root_path
    end

  end

  def destroy
    @comment = @post.comment.find(params[:id])

    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to root_path

  end

  private
  def comment_params
    params.require(:comment).permit(:content)


  end

  def set_post
    @post = Post.find(params[:post_id])

  end

  def create_notification(post)
    return if post.user.id == current_user.id
    Notification.create(user_id: post.user.id, subscribed_user_id: current_user.id, post_id: post.id, comment_id: comment.id, notice_type: 'comment')

  end

end
