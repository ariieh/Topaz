class Api::VotesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @vote = Vote.create(user_id: current_user.id, article_id: params[:article_id])
    
    Notification.create(notification_type: 3, user_id: @article.author.id, article_id: @article.id)
    render json: @article.votecount
  end
end