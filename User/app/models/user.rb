class User < ActiveRecord::Base
  has_secure_password

  has_many :secrets

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, presence: true
  validates :email, :uniqueness => true, format: { with: EMAIL_REGEX }
  
  before_save :lowercaser

  def lowercaser
    email.downcase!
  end
end
