class CommentsController < ApplicationController
  before_action :check_if_signed_in, only: [:create]
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.author_id = current_user.id
    
    if @comment.save
      Notification.create(notification_type: 2, user_id: @article.author.id, url: article_url(@article))
      redirect_to @article
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to @article
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text)
  end
end