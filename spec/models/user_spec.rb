require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
    expect(user.save).to eq(true)
  end

  it "is not valid without a name" do
    user.name = nil

    expect(user).not_to be_valid
  end

  it "is not valid without a email formats" do
    [nil, '', 'example@'].each do |fmt|
      user.email = fmt
      expect(user).not_to be_valid
    end
  end

  it "is not valid with a duplicate email" do
    create(:user) { create(:user, email: user.email) }

    expect(user).not_to be_valid
  end
end
