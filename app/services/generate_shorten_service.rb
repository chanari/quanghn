class GenerateShortenService < BaseService
  attr_reader :user, :original_url

  GENERATE_TIMES = 5

  def initialize(user, original_url)
    @retries = 0
    @user = user
    @original_url = original_url
  end

  def call
    shorten = ShortLink.create!(user: user, original_url: original_url, short_path: generate_short_path)
    shorten.short_path

  rescue ActiveRecord::RecordInvalid => exception
    retry if exception.record.errors.of_kind?(:short_path, :taken) && (@retries += 1) < GENERATE_TIMES

    raise exception
  end

  private

  def generate_short_path
    [*('a'..'z'), *('A'..'Z'), *('0'..'9')].shuffle[...5].join
  end
end
