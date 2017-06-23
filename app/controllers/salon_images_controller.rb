class SalonImagesController < ApplicationController
  before_action :set_salon_image, only: [:show, :edit, :update, :destroy]
  before_action :set_parent_salon, only: [:index, :new, :show, :edit, :update, :destroy, :create]
  layout 'admin'

  # GET /salon_images
  # GET /salon_images.json
  def index
    @salon_images = @salon.salon_images.all
  end

  # GET /salon_images/1
  # GET /salon_images/1.json
  def show
  end

  # GET /salon_images/new
  def new
    @salon_image = SalonImage.new
  end

  # GET /salon_images/1/edit
  def edit
  end

  # POST /salon_images
  # POST /salon_images.json
  def create
    @salon_image = @salon.salon_images.new(salon_image_params)

    respond_to do |format|
      if @salon_image.save
        format.html { redirect_to salon_salon_image_path(@salon, @salon_image), notice: 'Salon image was successfully created.' }
        format.json { render :show, status: :created, location: @salon_image }
      else
        format.html { render :new }
        format.json { render json: @salon_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salon_images/1
  # PATCH/PUT /salon_images/1.json
  def update
    respond_to do |format|
      if @salon_image.update(salon_image_params)
        format.html { redirect_to salon_salon_image_url(@salon, @salon_image), notice: 'Salon image was successfully updated.' }
        format.json { render :show, status: :ok, location: @salon_image }
      else
        format.html { render :edit }
        format.json { render json: @salon_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salon_images/1
  # DELETE /salon_images/1.json
  def destroy
    @salon_image.destroy
    respond_to do |format|
      format.html { redirect_to salon_salon_images_url(@salon), notice: 'Salon image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salon_image
      @salon_image = SalonImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salon_image_params
      params.require(:salon_image).permit(:name, :image_file, :type)
    end
end
