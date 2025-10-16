class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  # A user can see all the lists
  def index
    @lists = List.all
  end

   # A user can see the details of a given list and its name
  def show
    @bookmark = Bookmark.new # i want to acces @bookmark to add a new bookmark from the list show
  end

  # A user can create a new list

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_content
    end
  end

  def new
    @list = List.new
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :created_at, :updated_at)
  end

end
