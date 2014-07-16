class Api::ArticlesController < ApplicationController
  before_action :check_if_signed_in, only: [:new, :create, :edit, :update, :destroy]
  
  
  def index
    @page = params[:page]
    
    case params[:key]
    when "created_at"
      @articles = Article.created_at_cache(@page)
    when "votecount"
      @articles = Article.votecount_cache(@page)
    when "favorites"
      @articles = Article.favorites_cache(current_user.favorites, @page)
    when "tag"
      if (tag = Tag.find_by_name(params[:name]))
        @articles = Article.tag_cache(tag, @page)
      end
    when "user"
      @articles = Article.user_cache(User.find(params[:id]), @page)
    when "search"
      @articles = Article.search_cache(params[:query], @page)
    else
      @articles = Article.created_at_cache(@page)
    end

    @articles = Kaminari.paginate_array([]).page(@page) unless @articles
    
    render :index
  end
  
  def favorites
    @articles = current_user.favorites
    @articles.each_with_index do |article, index|
      @articles[index] = article.hashify
    end
    render json: @articles
  end

  def create
    Rails.cache.clear
    
    @article = current_user.articles.new(article_params)

    if @article.save
      render partial: "api/articles/article", locals: { article: @article }
    else
      render json: @article.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    @article = Article.find(params[:id])
    render partial: "api/articles/article", locals: { article: @article }
  end
  
  def tagshow
    @page = params[:page]
    @articles = Article.tag_cache(Tag.find_by_name(params[:name]), @page)
    render :index
  end
  
  def update
    Rails.cache.clear
    
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      render partial: "api/articles/article", locals: { article: @article }
    else
      render json: @article.errors, status: :unprocessable_entity      
    end
  end
  
  def destroy
    Rails.cache.clear
    
    current_user.articles.find(params[:id]).destroy
    head :ok
  end
  
  def votecount
    @article = Article.find(params[:id])
    render json: @article.votecount    
  end
  
  def htmlbody
    render json: Article.htmlbody(params[:body]).to_json
  end
  
  def body
    render json: Article.find(params[:id]).body.to_json
  end
  
  private
  
  def article_params
    params.permit(:title, :body, :taglist, :photo)
  end
end