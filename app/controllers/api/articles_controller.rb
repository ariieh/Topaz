class Api::ArticlesController < ApplicationController
  before_action :check_if_signed_in, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @articles = Article.all.to_a
    @articles.each_with_index do |article, index|
      @articles[index] = Article.hashify(article)
    end
    render json: @articles
    # redirect_to article_url(Article.last)
  end
  
  def favorites
    @articles = current_user.favorites
    @articles.each_with_index do |article, index|
      @articles[index] = Article.hashify(article)
    end
    render json: @articles
  end

  def create
    @article = current_user.articles.new(self.article_params)

    if @article.save
      render json: @article
      # redirect_to @article
    else
      # flash.now[:errors] = @article.errors.full_messages
      # render :new
      render json: @article.errors, status: :unprocessable_entity      
    end
  end
  
  def show
    @article = Article.find(params[:id])
    render json: Article.hashify(@article)
    # @view = params[:view] || nil
    # @el = params[:el] || nil
    # @article = Article.find(params[:id])
  end
  
  def tagshow
    @tag = Tag.find(params[:id])
    render json: @tag.articles.map(&:hashify)
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(self.article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity      
    end
    
    # @article = current_user.articles.find(params[:id])
    # if @article.update_attributes(article_params)
    #   redirect_to @article
    # else
    #   flash.now[:errors] = @article.errors.full_messages
    #   render :edit
    # end
  end
  
  def destroy
    # current_user.articles.find(params[:id]).destroy
    # redirect_to current_user
  end
  
  def votecount
    @article = Article.find(params[:id])
    render json: @article.votecount    
  end
  
  protected
  
  def article_params
    self.params.permit(:title, :body, :taglist, :photo)
  end
end