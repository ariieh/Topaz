class VotesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @vote = Vote.new(user_id: current_user.id, article_id: params[:article_id])
    
    if @vote.save
      redirect_to article_url(@article, view: "popular", el: nil)
    else
      flash[:errors] = @vote.errors.full_messages
      redirect_to article_url(@article, view: "popular", el: nil)
    end
  end
end
