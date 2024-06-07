class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authorize_book, except: %i[index show search]

  # GET /books or /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # renders index.html.erb
      format.json { render json: @books }
    end
  end

   # GET /books/1 or /books/1.json
   def show
    respond_to do |format|
      format.html # renders show.html.erb
      format.json { render json: @book }
    end
  end

  def new
    @book = Book.new
  end

  def edit; end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    authorize @book

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    authorize @book
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render json: @book, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    authorize @book
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @books = Book.where('title LIKE ? OR author LIKE ? OR genre LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")

    respond_to do |format|
      format.html # renders search.html.erb
      format.json { render json: @books }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def authorize_book
    authorize @book
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :isbn, :total_copies)
  end
end
