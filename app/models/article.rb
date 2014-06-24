class Article < ActiveRecord::Base
  validates :title, :body, :author, presence: true
  validates :title, uniqueness: { scope: :author_id }
  
  belongs_to :author, class_name: "User", foreign_key: :author_id, inverse_of: :articles
  has_many :comments, class_name: "Comment", foreign_key: :article_id, inverse_of: :article, dependent: :destroy
  has_many :taggings, inverse_of: :article, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy
  has_many :votes, inverse_of: :article
  
  def taglist=(tagstring)
    tags_to_add = tagstring.split(" ").uniq
                            .map { |tag| tag.strip.downcase }
                            .map { |tag| Tag.find_or_create_by(name: tag) }
    self.tags = tags_to_add
  end
  
  def taglist
    self.tags.map{ |tag| tag.name + " " }.join(" ")
  end
  
  def votecount
    self.votes.count
  end
end