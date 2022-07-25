class StaticPagesController < ApplicationController
  require 'flickr'
  before_action :set_static_page, only: %i[ show edit update destroy ]

  # GET /static_pages
  def index
    begin
      flickr = Flickr.new
      unless params[:user_id].blank?
        @photos = flickr.photos.search(user_id: params[:user_id])
      else
        @photos = flickr.photos.getRecent
      end
    rescue StandardError => e
      flash[:alert] = "#{e.class}: #{e.message}. Please try again..."
      redirect_to root_path
    end
  end

  # GET /static_pages/1
  def show
    @static_page = StaticPage.find(params[:id])

  end

  # GET /static_pages/new
  def new
    @static_page = StaticPage.new
  end

  # GET /static_pages/1/edit
  def edit
  end

  # POST /static_pages
  def create
    @static_page = StaticPage.new(static_page_params)

    hash = Auth.new
    @static_page.image = hash.get_photos_by_user_id(@static_page.id)

    if @static_page.save
      redirect_to @static_page, notice: "Static page was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /static_pages/1
  def update
    if @static_page.update(static_page_params)
      redirect_to @static_page, notice: "Static page was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /static_pages/1
  def destroy
    @static_page.destroy
    redirect_to static_pages_url, notice: "Static page was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_static_page
      @static_page = StaticPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def static_page_params
      params.require(:static_page).permit(:user_id, :id)
    end
end
