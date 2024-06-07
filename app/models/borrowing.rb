class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :borrowed_on, presence: true
  validates :due_on, presence: true
end
