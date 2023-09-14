class ShortLink < ApplicationRecord
  belongs_to :user

  validates :short_path, format: { with: /\A[a-zA-Z]{6}\z/ }, uniqueness: true
  validates :original_url, uniqueness: { scope: :user_id }
end
