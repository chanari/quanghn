class ShortLink < ApplicationRecord
  belongs_to :user

  SHORT_PATH_FORMAT = /\A[a-zA-Z0-9]{5}\z/
  ORIGINAL_URL_FORMAT = /\A#{URI::regexp(%w(http https))}\z/i

  validates :short_path, format: { with: SHORT_PATH_FORMAT }, uniqueness: true
  validates :original_url, uniqueness: { scope: :user_id }, format: { with: ORIGINAL_URL_FORMAT }
end
