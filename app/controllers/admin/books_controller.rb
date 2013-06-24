class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :load_data, only: [:new,:edit]

  # GET /books
  # GET /books.json
  def index
    @books = Admin::Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Admin::Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Admin::Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
  def load_data
    @publishers = Admin::Publisher.all
    @authors = Admin::Author.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Admin::Book.find(params[:id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params

    params.require(:book).permit(:title, :admin_publisher_id, :published_at,
                                 :page_counter, :isbn, :price, :blurb,
                                 author_ids: [])

  end
end
