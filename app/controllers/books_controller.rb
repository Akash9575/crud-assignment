class BooksController < ApplicationController


    before_action :set_book, only: [:show , :edit, :update, :destroy]

    def home
    
    end

    def about
    end


    def show
        # @book = Book.find(params[:id])
    end

    def index
        @book = Book.all
    end

    def new
        @book = Book.new
    end

    def edit
        # @book = Book.find(params[:id])
    end



    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "Book created succesfully"
            redirect_to book_path(@book) #it will redirect to show page or also we can write "redirect_to @article" both will work the same way
        else
            render :new, status: :unprocessable_entity
        end
    end


    def update
        # @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "Book updated succesfully"
            redirect_to @book
        else
            render :edit , status: :unprocessable_entity
        end
    end

    def destroy
        # @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:name,:description)
    end
end
