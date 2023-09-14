require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  let(:user) { create(:user) }
  let(:short_link) { build(:short_link, user: user) }

  it 'is valid with valid attributes' do
    expect(short_link).to be_valid
    expect(short_link.save).to eq(true)
  end

  it 'is not valid without a shorten formats' do
    short_link.short_path = 'strin@'

    expect(short_link).not_to be_valid
  end

  it 'is not valid with a duplicate shorten' do
    create(:short_link, short_path: short_link.short_path, user: user)

    expect(short_link).not_to be_valid
  end
end
