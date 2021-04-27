class User < ApplicationRecord
  validates :email,
            uniqueness: true,
            presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_secure_password
end
