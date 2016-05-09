class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_var, only: [:new, :edit, :create, :update, :show]
  before_action :authorize, only: [:new, :edit, :create, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params[:order].nil? or params[:order] == "1"
      @articles = Article.all.order(:title)
    elsif params[:order] == "2"
      @articles = Article.all.order(:author)
    elsif params[:order] == "3"
      @articles = Article.all.order(:ilustrator)
    elsif params[:order] == "4"
      @articles = Article.all.order(:photographer)
    elsif params[:order] == "5"
      @articles = Article.all.order(:gender)
    elsif params[:order] == "6"
      @articles = Article.all.order(:subject)
    elsif params[:order] == "7"
      @articles = Article.all.order(:magazineId)
    elsif params[:order] == "8"
      @articles = Article.all.order(:colorist)
    elsif params[:order] == "9"
      @articles = Article.all.order(:totalpages)
    elsif params[:order] == "10"
      @articles = Article.all.order(:pdf)
    elsif params[:order] == "11"
      @articles = Article.all.order(:thematicdesing)
    elsif params[:order] == "12"
      @articles = Article.all.order(:original)
    elsif params[:order] == "13"
      @articles = Article.all.order(:originallocation)
    elsif params[:order] == "14"
      @articles = Article.all.order(:section)
    end
    @articles = @articles.where(:title => params[:title]) if not params[:title].nil? and params[:title] != ''

    authors = Employee.all
    authors = authors.where(:name => params[:author_name]) if not params[:author_name].nil? and params[:author_name] != ''
    authors = authors.where(:gender => params[:author_gender]) if not params[:author_gender].nil? and params[:author_gender] != ''
    @articles = @articles.where(:author => authors)
    ilustrators = Employee.all
    ilustrators = ilustrators.where(:name => params[:ilustrator_name]) if not params[:ilustrator_name].nil? and params[:ilustrator_name] != ''
    ilustrators = ilustrators.where(:gender => params[:ilustrator_gender]) if not params[:ilustrator_gender].nil? and params[:ilustrator_gender] != ''
    #@articles = @articles.where(:ilustrator => ilustrators)
    photographers = Employee.all
    photographers = photographers.where(:name => params[:photographer_name]) if not params[:photographer_name].nil? and params[:photographer_name] != ''
    photographers = photographers.where(:gender => params[:photographer_gender]) if not params[:photographer_gender].nil? and params[:photographer_gender] != ''
    #@articles = @articles.where(:photographer => photographers)
    @articles = @articles.where(:gender => params[:gender]) if not params[:gender].nil? and params[:gender] != ''
    @articles = @articles.where(:subject => params[:subject]) if not params[:subject].nil? and params[:subject] != ''
    magazine = Magazine.all
    magazine = magazine.where(:number => params[:magazine_number]) if not params[:magazine_number].nil? and params[:magazine_number] != ''
    magazine = magazine.where(:month => params[:magazine_month]) if not params[:magazine_month].nil? and params[:magazine_month] != ''
    magazine = magazine.where(:year => params[:magazine_year]) if not params[:magazine_year].nil? and params[:magazine_year] != ''
    magazine = magazine.where(:cd => params[:magazine_cd]) if not params[:magazine_cd].nil? and params[:magazine_cd] != ''
    magazine = magazine.where(:issn => params[:magazine_issn]) if not params[:magazine_issn].nil? and params[:magazine_issn] != ''
    @articles = @articles.where(:magazineId => magazine)
    colorists = Employee.all
    colorists = colorists.where(:name => params[:colorist_name]) if not params[:colorist_name].nil? and params[:colorist_name] != ''
    colorists = colorists.where(:gender => params[:colorist_gender]) if not params[:colorist_gender].nil? and params[:colorist_gender] != ''
    #@articles = @articles.where(:colorist => colorists)
    @articles = @articles.where(:totalpages => params[:totalpages]) if not params[:totalpages].nil? and params[:totalpages] != ''
    @articles = @articles.where(:pdf => params[:pdf]) if not params[:pdf].nil? and params[:pdf] != ''
    @articles = @articles.where(:thematicdesing => params[:thematicdesing]) if not params[:thematicdesing].nil? and params[:thematicdesing] != ''
    @articles = @articles.where(:original => params[:original]) if not params[:original].nil? and params[:original] != ''
    @articles = @articles.where(:originallocation => params[:originallocation]) if not params[:originallocation].nil? and params[:originallocation] != ''
    @articles = @articles.where(:section => params[:section]) if not params[:section].nil? and params[:section] != ''

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize
      authorize! [:new, :create, :edit , :update, :destroy], @article
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def set_var
      @employees = Employee.all.map{|u| [u.name, u.id]}
      @magazines = Magazine.all.map{|u| [u.number, u.id]}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :author, :ilustrator, :photographer, :gender, :subject, :magazineId, :colorist, :totalpages, :pdf, :thematicdesing, :original, :originallocation, :section)
    end
end
