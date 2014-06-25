class VotesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @vote = Vote.new(user_id: current_user.id, article_id: params[:article_id])
    
    if @vote.save
      Notification.create(notification_type: 3, user_id: @article.author.id, url: article_path(@article))
      redirect_to article_url(@article, view: "popular", el: nil)
    else
      flash[:errors] = @vote.errors.full_messages
      redirect_to article_url(@article, view: "popular", el: nil)
    end
  end
end
