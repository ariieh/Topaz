require 'bcrypt'

class User < ActiveRecord::Base
  # include PgSearch
  # multisearchable against: [:username, :email]
  
  attr_reader :password
  
  validates :username, :email, :password_digest, presence: true
  validates :password, length: { minimum: 6 }, presence: true, allow_nil: true
  
  has_many :articles, class_name: "Article", foreign_key: :author_id, inverse_of: :author
  has_many :comments, class_name: "Comment", foreign_key: :author_id, inverse_of: :author
  has_many :votes, inverse_of: :user
  has_many :favorites, through: :votes, source: :article
  has_many :notifications
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    return user if BCrypt::Password.new(user.password_digest).is_password?(password)
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end
  
  def self.find_or_create_by_facebook(provider, uid, name, email)
    user = User.find_by(provider: provider, uid: uid)
    unless user
      user = User.new(provider: provider, uid: uid, username: name, email: email)
      user.password_digest = SecureRandom.urlsafe_base64(16)
      user.save!
    end
    user
  end
  
  def self.hashify(user)
    jsonuser = JSON.parse(user.to_json)
    jsonuser[:votes] = user.votes.pluck(:article_id)
    jsonuser
  end
  
  def hashify
    User.hashify(self)
  end
  
end