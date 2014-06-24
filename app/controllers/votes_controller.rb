class VotesController < ApplicationController
  def create
    @vote = Vote.new(author_id: current_user.id, )
  end
  
  private
  
  def vote_params
    params.require(:votes).permit(:)
  end
end
