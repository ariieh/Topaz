class Api::StaticPagesController < ApplicationController
  
  def about
  end
  
  def search
    if !params[:query].blank?
      @results = PgSearch.multisearch(params[:query]).includes(:searchable)
    else
      @results = PgSearch::Document.all
    end
    
    render partial: "api/search/results", locals: { results: @results.map(&:searchable) }
  end
end