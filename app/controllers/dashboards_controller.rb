class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def librarian
    @total_books = Book.count
    @total_borrowed_books = Borrowing.where(returned_on: nil).count
    @books_due_today = Borrowing.where(due_on: Date.today, returned_on: nil)
    @overdue_books = Borrowing.where('due_on < ? AND returned_on IS NULL', Date.today)
  end

  def member
    @borrowings = current_user.borrowings
    @overdue_books = current_user.borrowings.where('due_on < ? AND returned_on IS NULL', Date.today)
  end
end
