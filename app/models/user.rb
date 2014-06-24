require 'bcrypt'

class User < ActiveRecord::Base
  attr_reader :password
  
  validates :username, :email, :password_digest, presence: true
  validates :password, length: { minimum: 6 }, presence: true, allow_nil: true
  
  has_many :articles, class_name: "Article", foreign_key: :author_id, inverse_of: :author
  has_many :comments, class_name: "Comment", foreign_key: :author_id, inverse_of: :author
  has_many :votes, inverse_of: :user
  
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
  
end