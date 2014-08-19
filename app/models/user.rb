class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :presence => true
  validates :email, :presence => true, uniqueness: {:message => "Email already taken."}
  validates :username, :presence => true, uniqueness: {:message => "Username already taken."}

  attr_accessor :password

  validates_confirmation_of :password
  before_save :encrypt_password

  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :votes, :dependent => :destroy 
  
  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate email, password
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def full_name
    first_name.capitalize + " " + last_name.capitalize 
  end

  def full_name_with_username
    self.full_name + " @"+ username
  end

  def get_vote voteable
    voteable.votes.where(:user_id => self.id).first || voteable.votes.create(:user_id => self.id, :vote_value => 0)
  end
end
