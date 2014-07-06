require "erb"
include ERB::Util
include ActionView::Helpers::TextHelper

class Article < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search,
                  :against => {:title => "A", :body => "B"},
                  :using => {
                    :tsearch => {:prefix => true}
                  }

  validates :title, :body, :author, presence: true
  validates :title, uniqueness: { scope: :author_id }
  
  belongs_to :author, class_name: "User", foreign_key: :author_id, inverse_of: :articles
  has_many :comments, class_name: "Comment", foreign_key: :article_id, inverse_of: :article, dependent: :destroy
  has_many :taggings, inverse_of: :article, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy
  has_many :votes, inverse_of: :article
  has_attached_file :photo, :styles => {
    :big => "400x400#"
  }
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  
  def self.hashify(article)
    jsonarticle = JSON.parse(article.to_json)
    jsonarticle[:body] = simple_format(h article.body)
    jsonarticle[:votecount] = article.votecount
    jsonarticle[:taglist] = article.taglist
    jsonarticle[:photo_url] = article.photo.url(:big)
    jsonarticle
  end
  
  def hashify
    Article.hashify(self)
  end
  
  def htmlbody
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(escape_html: true), autolink: true, tables: true)
    @markdown.render(self.body)
  end
  
  def taglist=(tagstring)
    tags_to_add = tagstring.split(/\W+/).uniq
                            .map { |tag| tag.strip.downcase }
                            .map { |tag| Tag.find_or_create_by(name: tag) }
    self.tags = tags_to_add
  end
  
  def taglist
    self.tags.pluck(:name)
  end
  
  def votecount
    self.votes.count
  end
end