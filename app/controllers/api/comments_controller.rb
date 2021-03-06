class Api::CommentsController < ApplicationController
  before_action :check_if_signed_in, only: [:create]
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.author_id = current_user.id
    
    if @comment.save
      Notification.create(notification_type: 2, user_id: @article.author.id, article_id: @article.id)
      render partial: "api/comments/comment", locals: { comment: @comment }
    else
      render json: @comment.errors
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
    render partial: "api/comments/comment", locals: { comment: @comment }
  end
  
  private
  
  def comment_params
    params.permit(:text, :p_id)
  end  
end