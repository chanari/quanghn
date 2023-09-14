class User < ApplicationRecord
  has_many :short_links, dependent: :destroy

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }
  validates :password_digest, presence: true

  has_secure_password
end
