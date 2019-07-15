class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password

  validates :role, presence: true
  validates :username,  presence: true, length: { maximum: 25 },
                    uniqueness: { case_sensitive: false }, allow_blank: false

  has_many :attendances
  
  # Returns a token for remembering users.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
