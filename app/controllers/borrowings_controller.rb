class BorrowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_borrowing, only: %i[update]

  def index
    @borrowings = Borrowing.all
    authorize @borrowings
  end

  def new
    @borrowing = Borrowing.new
    authorize_borrowing
  end

  def edit
  end

  def create
    @borrowing = current_user.borrowings.build(borrowing_params)
    authorize_borrowing

    if @borrowing.save
      redirect_to @borrowing.book, notice: 'Book was successfully borrowed.'
    else
      redirect_to @borrowing.book, alert: 'Unable to borrow book.'
    end
  end

  def update
    if @borrowing.update(returned_on: Date.today)
      redirect_to @borrowing.book, notice: 'Book was successfully returned.'
    else
      redirect_to @borrowing.book, alert: 'Unable to return book.'
    end
  end

  private

  def set_borrowing
    @borrowing = Borrowing.find(params[:id])
  end

  def authorize_borrowing
    authorize @borrowing
  end

  def borrowing_params
    params.require(:borrowing).permit(:book_id).merge(borrowed_on: Date.today, due_on: 2.weeks.from_now)
  end
end
