class BooksController < ApplicationController
  include WillPaginate::ViewHelpers
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index,:show]

  # GET /books
  # GET /books.json
  def index
    per_page = params[:per_page] || 10

    @books = Book.all

    unless current_user
      @books = @books.where(category_id: params[:category]) if params[:category].present? && params[:category] != 'All'

      @books = @books.where(author_id: params[:author]) if params[:author].present? && params[:author] != 'All'

      @books = @books.search(params[:search]) if params[:search].present?

      @total_books = @books.count

      @books = @books.paginate(:page => params[:page], :per_page => per_page)
    end
    respond_to do |format|
      format.html{}
      format.json{render json: {books: @books, pagination: will_paginate(@books, renderer: FoundationPagination::Rails).try(:gsub, ".json",""), total_books: @total_books}}
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
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
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    begin
      if @book.destroy
        respond_to do |format|
          format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        flash[:alert] = nice_error @book.errors.full_messages, "Error deleting book"
        redirect_to :back
      end
    rescue Exception => e
      flash[:alert] = nice_error [e.message], "Error deleting book."
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :description, :unit_price, :author_id, :category_id, :publisher_id, :book_image)
    end
end
