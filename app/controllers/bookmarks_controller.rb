class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create] # will finde right list id before new and create
  before_action :set_bookmark, only: [:destroy] # will find right bookmark id before destroy

  # A user can add a new bookmark (movie/list pair) to an existing list
  def create
    @bookmark = @list.bookmarks.new(bookmark_params) # autimatically sets list as foreign-key
    # alternative: creating new bookmark and then manually setting foreign key
    # @bookmark.list = @list
    if @bookmark.save
      redirect_to @list, notice: "Bookmark created successfully!"
    else
      render :new
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  # A user can delete a bookmark from a list
  def destroy
    @bookmark.destroy
    redirect_to @bookmark.list, notice: "Bookmark deleted!"
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id) # list id we already have because it's nested
  end

end
