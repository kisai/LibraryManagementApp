require 'rails_helper'

RSpec.describe Borrowing, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:borrowing)).to be_valid
  end

  it 'is invalid without a borrowed_on date' do
    expect(FactoryBot.build(:borrowing, borrowed_on: nil)).to_not be_valid
  end

  it 'is invalid without a due_on date' do
    expect(FactoryBot.build(:borrowing, due_on: nil)).to_not be_valid
  end
end
