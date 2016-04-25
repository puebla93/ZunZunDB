class MagazinesController < ApplicationController
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]

  # GET /magazines
  # GET /magazines.json
  def index
    @magazines = Magazine.all
    #@magazines=@magazines.where(:name => params[:name]) if params[:name].nil?
  end

  # GET /magazines/1
  # GET /magazines/1.json
  def show
  end

  # GET /magazines/new
  def new
    @magazine = Magazine.new
    authorize! :new, @magazine
  end

  # GET /magazines/1/edit
  def edit
    authorize! :edit, @magazine
  end

  # POST /magazines
  # POST /magazines.json
  def create
    @magazine = Magazine.new(magazine_params)
    authorize! :create, @magazine

    respond_to do |format|
      if @magazine.save
        format.html { redirect_to @magazine, notice: 'Magazine was successfully created.' }
        format.json { render :show, status: :created, location: @magazine }
      else
        format.html { render :new }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magazines/1
  # PATCH/PUT /magazines/1.json
  def update
    authorize! :update, @magazine

    respond_to do |format|
      if @magazine.update(magazine_params)
        format.html { redirect_to @magazine, notice: 'Magazine was successfully updated.' }
        format.json { render :show, status: :ok, location: @magazine }
      else
        format.html { render :edit }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magazines/1
  # DELETE /magazines/1.json
  def destroy
    authorize! :destroy, @magazine

    @magazine.destroy
    respond_to do |format|
      format.html { redirect_to magazines_url, notice: 'Magazine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magazine_params
      params.require(:magazine).permit(:number, :month, :year, :cd, :issn)
    end
end
