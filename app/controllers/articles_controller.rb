class ArticlesController < ApplicationController
  before_action :check_if_signed_in, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @articles = Article.order(:created_at).reverse
  end

  def new
    @article = current_user.articles.new
  end
  
  def create
    @article = current_user.articles.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      flash.now[:errors] = @article.errors.full_messages
      render :new
    end
  end
  
  def show
    @view = params[:view] || nil
    @el = params[:el] || nil
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = current_user.articles.find(params[:id])
  end
  
  def update
    @article = current_user.articles.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to @article
    else
      flash.now[:errors] = @article.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    current_user.articles.find(params[:id]).destroy
    redirect_to current_user
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :body, :taglist)
  end
end