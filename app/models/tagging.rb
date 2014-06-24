class Tagging < ActiveRecord::Base
  validates :tag, :article, presence: true
  
  belongs_to :tag, inverse_of: :taggings
  belongs_to :article, inverse_of: :taggings
end