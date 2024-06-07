class Book < ApplicationRecord
  has_many :borrowings
  has_many :users, through: :borrowings

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :total_copies, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def available?
    total_copies - borrowings.count > 0
  end
end
