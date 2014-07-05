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
    # jsonarticle[:html_body] = article.htmlify
    jsonarticle
  end
  
  def hashify
    Article.hashify(self)
  end
  
  def htmlbody
    simple_format(h self.body)
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
  
  # def htmlify
  #   body_text = simple_format(self.body)
  #   body_text.scan("<p>").each_with_index do |p, index|
  #     body_text[body_text.index(p)..body_text.index(p)+2] = "<div id=\"#{index + 1}\"><p >"
  #   end
  #
  #   body_text.scan("</p>").each_with_index do |p, index|
  #     body_text[body_text.index(p)..body_text.index(p)+3] = "</p >
  #
  #     <div class='comment-button'>
  #       <i class='fa fa-comment'>
  #         <span class='comment-count'>
  #           #{self.comments.where(p_id: index+1).count}
  #         </span>
  #       </i>
  #     </div>
  #     <div class='comment-box'>
  #       #{self.comments.where(p_id: index+1).order(:created_at).reverse
  #                 .map{ |comment| comment.author.username + ": " + comment.text }
  #              .join("<br>")}
  #           <form class='comment-form'
  #       action='http://localhost:3000/articles/#{self.id}/comments' method='post'>
  #               <input type='text' name='comment[text]'>
  #             <input type='hidden' name='comment[p_id]' value='#{index+1}'>
  #               <input type='submit' value='Add Comment'>
  #          </form>
  #     </div>
  #     </div>"
  #   end
  #
  #   return body_text
  # end
  
end