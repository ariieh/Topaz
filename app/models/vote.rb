class Vote < ActiveRecord::Base
  validates :article, :user, presence: true
  validates :article, uniqueness: { scope: :user_id }
  
  belongs_to :article, inverse_of: :votes
  belongs_to :user, inverse_of: :votes
end
