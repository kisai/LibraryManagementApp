require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:book)).to be_valid
  end

  it 'is invalid without a title' do
    expect(FactoryBot.build(:book, title: nil)).to_not be_valid
  end

  it 'is invalid without an author' do
    expect(FactoryBot.build(:book, author: nil)).to_not be_valid
  end

  it 'is invalid without a genre' do
    expect(FactoryBot.build(:book, genre: nil)).to_not be_valid
  end

  it 'is invalid without an isbn' do
    expect(FactoryBot.build(:book, isbn: nil)).to_not be_valid
  end

  it 'is invalid without total copies' do
    expect(FactoryBot.build(:book, total_copies: nil)).to_not be_valid
  end
end
