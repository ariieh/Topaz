class ArticlesController < ApplicationController
  def new
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
    @article = Article.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
end