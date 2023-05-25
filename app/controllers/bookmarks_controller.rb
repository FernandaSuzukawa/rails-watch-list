class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit update destroy ]

  # GET /bookmarks or /bookmarks.json
  def index
    @bookmarks = Bookmark.all
  end

  # GET /bookmarks/1 or /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  # GET /bookmarks/1/edit

  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookmarks/1 or /bookmarks/1.json

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: "Bookmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:movie_id, :list_id, :comment)
    end
end
