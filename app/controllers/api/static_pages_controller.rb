class Api::StaticPagesController < ApplicationController
  
  def empty
  end
  
  def search
    if !params[:query].blank?
      @results = PgSearch.multisearch(params[:query])
                             .includes(:searchable)
                             .page(params[:page])
    else
      @results = PgSearch::Document.all.page(params[:page])
    end
    
    render partial: "api/search/results", locals: { results: @results.map(&:searchable) }
  end
end