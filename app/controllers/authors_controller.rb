class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    #creates new unsaved, unvalidated Post object
    @author = Author.new(author_params)
    #Run the validations witout trying to save to the database
    #returns true if valid
    if @author.valid?
      #if valid save item
      @author.save
      #return status code 302
      #redirects user to instance of the post
      redirect_to author_path(@author)
    else
      #it is invalid and now full of useful error messages to hold on to and re-render :new page, which know how to display error messages along side user's entries.
      render :new
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
