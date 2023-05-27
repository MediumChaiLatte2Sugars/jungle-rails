class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 9 }
  validates :password, format: { with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/,
    message: "must contain at least one digit, one lowercase letter, one uppercase letter, and one symbol" }
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true
end
