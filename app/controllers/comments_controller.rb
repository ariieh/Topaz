class CommentsController < ApplicationController
  def create
    fail
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.author_id = current_user.id
    
    if @comment.save
      redirect_to @article
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text)
  end
end