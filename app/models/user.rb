class User < ApplicationRecord
  has_secure_password

  validates :role, presence: true
  validates :username,  presence: true, length: { maximum: 25 },
                    uniqueness: { case_sensitive: false }, allow_blank: false
end
