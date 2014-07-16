class Api::ArticlesController < ApplicationController
  before_action :check_if_signed_in, only: [:new, :create, :edit, :update, :destroy]
  
  
  def index
    @page = params[:page]
    
    case params[:key]
    when "created_at"
      # @articles = Article.created_at_cache(@page)
      @articles = Article.order(params[:key] => :desc).page(params[:page])
    when "votecount"
      @articles = Article.votecount_cache(@page)
    when "favorites"
      @articles = current_user.favorites
                              .order("created_at" => :desc)
                              .page(@page)
    when "tag"
      if (@tag = Tag.find_by_name(params[:name]))
        @articles = @tag.articles
                        .order("created_at" => :desc)
                        .page(@page)
      end
    when "user"
      @articles = User.find(params[:id].to_i)
                      .articles
                      .order("created_at" => :desc)
                      .page(@page)
    when "search"
      @results = params[:query].blank? ? Article.all : Article.search(params[:query])
      @articles = @results.page(@page).per(5)
    else
      @articles = Article.order("created_at" => :desc)
                          .page(@page)
    end

    unless @articles
      @articles = Kaminari.paginate_array([]).page(@page)
    end
    
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
    @articles = Tag.find_by_name(params[:name]).articles.page(params[:page])
    render :index
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      render partial: "api/articles/article", locals: { article: @article }
    else
      render json: @article.errors, status: :unprocessable_entity      
    end
  end
  
  def destroy
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