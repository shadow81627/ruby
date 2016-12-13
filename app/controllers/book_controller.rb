class BookController < ApplicationController
  
   #List all of the books
   def list
      @books = Book.all
   end
   
   #Show detail on a single book
   def show
      @book = Book.find(params[:id])
   end
   
   #Gets the data for the new book inputs page.
   def new
      @book = Book.new
      @subjects = Subject.all
   end
   
   #Creates a book using the params and redirects to the list
   def create
      @book = Book.new(book_params)
   	
      if @book.save
         redirect_to :action => 'list'
      else
         @subjects = Subject.all
         render :action => 'new'
      end
      
   end
   
   #The parameters for a book
   def book_params
      params.require(:books).permit(:title, :price, :subject_id, :description)
   end
   
   #Gets the data for the Edit page
   def edit
      @book = Book.find(params[:id])
      @subjects = Subject.all
   end
   
   #Updates the a Book
   def update
      @book = Book.find(params[:id])
   	
      if @book.update_attributes(book_param)
         redirect_to :action => 'show', :id => @book
      else
         @subjects = Subject.all
         render :action => 'edit'
      end
      
   end
   
   #Removes a Book from the database
   def delete
      Book.find(params[:id]).destroy
      redirect_to :action => 'list'
   end
   
end