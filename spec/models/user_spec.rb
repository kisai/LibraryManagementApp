require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is invalid without an email' do
    expect(FactoryBot.build(:user, email: nil)).to_not be_valid
  end
end
