class CommentsController < ApplicationController
before_filter :check_logged_in, :only => :destroy
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
private
  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
            username == "shirwa" && password == "root"
    end
end
end