class MagazinesController < ApplicationController
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:new, :edit, :create, :update, :destroy]

  # GET /magazines
  # GET /magazines.json
  def index
    if params[:order].nil? or params[:order] == "1"
      @magazines = Magazine.all.order(:number)
    elsif params[:order] == "2"
      @magazines = Magazine.all.order(:month)
    elsif params[:order] == "3"
      @magazines = Magazine.all.order(:year)
    elsif params[:order] == "4"
      @magazines = Magazine.all.order(:cd)
    elsif params[:order] == "5"
      @magazines = Magazine.all.order(:issn)
    end
    @magazines = @magazines.where(:number => params[:number]) if not params[:number].nil? and params[:number] != ''
    @magazines = @magazines.where(:month => params[:month]) if not params[:month].nil? and params[:month] != ''
    @magazines = @magazines.where(:year => params[:year]) if not params[:year].nil? and params[:year] != ''
    @magazines = @magazines.where(:cd => params[:cd]) if not params[:cd].nil? and params[:cd] != ''
    @magazines = @magazines.where(:issn => params[:issn]) if not params[:issn].nil? and params[:issn] != ''
  end

  # GET /magazines/1
  # GET /magazines/1.json
  def show
  end

  # GET /magazines/new
  def new
    @magazine = Magazine.new
  end

  # GET /magazines/1/edit
  def edit
  end

  # POST /magazines
  # POST /magazines.json
  def create
    @magazine = Magazine.new(magazine_params)

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
    @magazine.destroy
    respond_to do |format|
      format.html { redirect_to magazines_url, notice: 'Magazine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize
      authorize! [:new, :create, :edit , :update, :destroy], @magazine
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magazine_params
      params.require(:magazine).permit(:number, :month, :year, :cd, :issn)
    end
end
