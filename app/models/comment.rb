class Comment < ActiveRecord::Base
  # include PgSearch
  # multisearchable against: [:text, :author]
  
  validates :text, :author, :article, presence: true
  
  belongs_to :author, class_name: "User", foreign_key: :author_id, inverse_of: :comments
  belongs_to :article, class_name: "Article", foreign_key: :article_id, inverse_of: :comments
end