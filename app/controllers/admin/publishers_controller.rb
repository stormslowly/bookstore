class Admin::PublishersController < ApplicationController
  before_action :set_admin_publisher, only: [:show, :edit, :update, :destroy]
  before_action :set_title
  # GET /admin/publishers
  # GET /admin/publishers.json
  def index
    @admin_publishers = Publisher.all
  end

  # GET /admin/publishers/1
  # GET /admin/publishers/1.json
  def show
  end

  # GET /admin/publishers/new
  def new
    @admin_publisher = Publisher.new
  end

  # GET /admin/publishers/1/edit
  def edit
  end

  # POST /admin/publishers
  # POST /admin/publishers.json
  def create
    @admin_publisher = Publisher.new(admin_publisher_params)

    respond_to do |format|
      if @admin_publisher.save
        format.html { redirect_to @admin_publisher, notice: 'Publisher was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_publisher }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/publishers/1
  # PATCH/PUT /admin/publishers/1.json
  def update
    respond_to do |format|
      if @admin_publisher.update(admin_publisher_params)
        format.html { redirect_to @admin_publisher, notice: 'Publisher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/publishers/1
  # DELETE /admin/publishers/1.json
  def destroy
    @admin_publisher.destroy
    respond_to do |format|
      format.html { redirect_to publishers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_publisher
      @admin_publisher = Publisher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_publisher_params
      params.require(:publisher).permit(:name)
    end

    def set_title
      @title = 'Publisher Admin'
    end
end
