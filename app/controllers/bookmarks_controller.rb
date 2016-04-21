class BookmarksController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.where(user_id: current_user.id).order(category_id: :desc)
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    if @bookmark.save
      flash[:notice] = "Bookmark added successfully."
      redirect_to bookmarks_path
    else
      flash[:error] = @bookmark.errors.full_messages.join(". ")
      @bookmarks = Bookmark.where(user_id: current_user.id).order(category_id: :desc)
      render :index
    end
  end



  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark updated successfully."
      redirect_to bookmarks_path
    else
      flash[:error] = @bookmark.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    current_user
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:alert] = "#{@bookmark.title} has been deleted"
      redirect_to bookmarks_path
    else
      flash[:alert] = "Error: Bar has not been deleted"
      redirect_to bookmarks_path
    end
  end
    private
    def bookmark_params
      params.require(:bookmark).permit(
      :title,
      :description,
      :url,
      :category_id)
    end
end
