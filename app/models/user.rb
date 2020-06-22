# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase, self.username = username.downcase }
  before_create :remember_token
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_one_attached :avatar
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :likes, dependent: :destroy

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)

    #if ActiveModel::SecurePassword.min_cost cost = BCrypt::Engine::MIN_COST 

    #else 
      #cost =  BCrypt::Engine.cost
    #end
    
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end

  def fan(user)
    following.include? user
  end

  def followers
    inverse_followings.map(&:user)
  end

  def following
    followings.map(&:follower)
  end

  def nonfollowers
    User.where.not(id: followers)
  end
end
