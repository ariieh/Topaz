class Tag < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :taggings, inverse_of: :tag
  has_many :articles, through: :taggings
end