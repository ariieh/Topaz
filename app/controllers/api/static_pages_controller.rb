class Api::StaticPagesController < ApplicationController
  
  def about
  end
  
  def search
    if !params[:query].blank?
      @results = PgSearch.multisearch(params[:query])
                          .includes(:searchable)
    else
      @results = PgSearch::Document.all      
    end
    
    @articles = Kaminari.paginate_array(@results.map(&:searchable)).page(params[:page]).per(5)
    render "api/articles/index"# , locals: { articles: @results.map(&:searchable) }
  end
end