class Api::ArticlesController < ApplicationController
  before_action :check_if_signed_in, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @page = params[:page]
    
    if params[:key] == "created_at"
      @articles = Article.order(params[:key] => :desc).page(params[:page])
    elsif params[:key] == "votecount"
      query = <<-SQL
        SELECT articles.*
        FROM articles JOIN votes ON articles.id = votes.article_id
        GROUP BY articles.id
        ORDER BY COUNT(*) DESC
      SQL
      
      @articles = Kaminari.paginate_array(Article.find_by_sql(query)).page(params[:page])
    elsif params[:key] == "favorites"
      @articles = current_user.favorites.page(params[:page])
    elsif params[:key] == "tag"
      @articles = Tag.find_by_name(params[:name]).articles.page(params[:page])
    elsif params[:key] == "user"
      @articles = User.find(params[:id].to_i).articles.page(params[:page])
      @articles = @articles.per(Article.count)
    else
      @articles = Article.order("created_at" => :desc).page(params[:page])
    end
    # @articles.each_with_index do |article, index|
    #   @articles[index] = article.hashify
    # end
    #render json: @articles
    # redirect_to article_url(Article.last)
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
    @article = current_user.articles.new(self.article_params)

    if @article.save
      render partial: "api/articles/article", locals: { article: @article }
      # redirect_to @article
    else
      # flash.now[:errors] = @article.errors.full_messages
      # render :new
      render json: @article.errors, status: :unprocessable_entity      
    end
  end
  
  def show
    @article = Article.find(params[:id])
    #render json: @article.hashify
    # @view = params[:view] || nil
    # @el = params[:el] || nil
    # @article = Article.find(params[:id])
    render partial: "api/articles/article", locals: { article: @article }
  end
  
  def tagshow
    @articles = Tag.find_by_name(params[:name]).articles.page(params[:page])
    render :index
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(self.article_params)
      render partial: "api/articles/article", locals: { article: @article }
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
    current_user.articles.find(params[:id]).destroy
    head :ok
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