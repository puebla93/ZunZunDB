class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_var, only: [:new, :index, :edit, :create, :update]
  before_action :authorize, only: [:new, :edit, :create, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    if params[:order].nil? or params[:order] == "1"
      @books = Book.all.order(:title)
    elsif params[:order] == "2"
      @books = Book.all.order(:year)
    elsif params[:order] == "3"
      @books = Book.all.order(:author)
    elsif params[:order] == "4"
      @books = Book.all.order(:ilustrator)
    elsif params[:order] == "5"
      @books = Book.all.order(:photographer)
    elsif params[:order] == "6"
      @books = Book.all.order(:totalpages)
    elsif params[:order] == "7"
      @books = Book.all.order(:format)
    elsif params[:order] == "8"
      @books = Book.all.order(:editor)
    elsif params[:order] == "9"
      @books = Book.all.order(:editionyear)
    elsif params[:order] == "10"
      @books = Book.all.order(:editora)
    elsif params[:order] == "11"
      @books = Book.all.order(:isbn)
    elsif params[:order] == "12"
      @books = Book.all.order(:binding)
    elsif params[:order] == "13"
      @books = Book.all.order(:realisation)
    elsif params[:order] == "14"
      @books = Book.all.order(:designer)
    elsif params[:order] == "15"
      @books = Book.all.order(:correction)
    elsif params[:order] == "16"
      @books = Book.all.order(:clasification)
    elsif params[:order] == "17"
      @books = Book.all.order(:content)
    elsif params[:order] == "18"
      @books = Book.all.order(:banner)
    elsif params[:order] == "19"
      @books = Book.all.order(:troquelado)
    elsif params[:order] == "20"
      @books = Book.all.order(:collection)
    end
    @books = @books.where(:title => params[:title]) if not params[:title].nil? and params[:title] != ''
    @books = @books.where(:year => params[:year]) if not params[:year].nil? and params[:year] != ''

    authors = Employee.all
    authors = authors.where(:name => params[:author_name]) if not params[:author_name].nil? and params[:author_name] != ''
    authors = authors.where(:gender => params[:author_gender]) if not params[:author_gender].nil? and params[:author_gender] != ''
    @books = @books.where(:author => authors)
    ilustrators = Employee.all
    ilustrators = ilustrators.where(:name => params[:ilustrator_name]) if not params[:ilustrator_name].nil? and params[:ilustrator_name] != ''
    ilustrators = ilustrators.where(:gender => params[:ilustrator_gender]) if not params[:ilustrator_gender].nil? and params[:ilustrator_gender] != ''
    #@books = @books.where(:ilustrator => ilustrators)
    photographers = Employee.all
    photographers = photographers.where(:name => params[:photographer_name]) if not params[:photographer_name].nil? and params[:photographer_name] != ''
    photographers = photographers.where(:gender => params[:photographer_gender]) if not params[:photographer_gender].nil? and params[:photographer_gender] != ''
    #@books = @books.where(:photographer => photographers)
    @books = @books.where(:totalpages => params[:totalpages]) if not params[:totalpages].nil? and params[:totalpages] != ''
    @books = @books.where(:format => params[:format]) if not params[:format].nil? and params[:format] != ''
    editors = Employee.all
    editors = editors.where(:name => params[:editor_name]) if not params[:editor_name].nil? and params[:editor_name] != ''
    editors = editors.where(:gender => params[:editor_gender]) if not params[:editor_gender].nil? and params[:editor_gender] != ''
    #@books = @books.where(:editor => editors)
    @books = @books.where(:editionyear => params[:editionyear]) if not params[:editionyear].nil? and params[:editionyear] != ''
    @books = @books.where(:editora => params[:editora]) if not params[:editora].nil? and params[:editora] != ''
    @books = @books.where(:isbn => params[:isbn]) if not params[:isbn].nil? and params[:isbn] != ''
    @books = @books.where(:binding => params[:binding]) if not params[:binding].nil? and params[:binding] != ''
    @books = @books.where(:realisation => params[:realisation]) if not params[:realisation].nil? and params[:realisation] != ''
    designers = Employee.all
    designers = designers.where(:name => params[:designer_name]) if not params[:designer_name].nil? and params[:designer_name] != ''
    designers = designers.where(:gender => params[:designer_gender]) if not params[:designer_gender].nil? and params[:designer_gender] != ''
    #@books = @books.where(:designer => designers)
    @books = @books.where(:correction => params[:correction]) if not params[:correction].nil? and params[:correction] != ''
    @books = @books.where(:clasification => params[:clasification]) if not params[:clasification].nil? and params[:clasification] != ''
    @books = @books.where(:content => params[:content]) if not params[:content].nil? and params[:content] != ''
    @books = @books.where(:banner => params[:banner]) if not params[:banner].nil? and params[:banner] != ''
    @books = @books.where(:troquelado => params[:troquelado]) if not params[:troquelado].nil? and params[:troquelado] != ''
    @books = @books.where(:collection => params[:collection]) if not params[:collection].nil? and params[:collection] != ''
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def authorize
      authorize! [:new, :create, :edit , :update, :destroy], @book
    end

    def set_book
      @book = Book.find(params[:id])
    end

    def set_var
      @employees = Employee.all.map{|u| [u.name, u.id]}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :year, :author, :ilustrator, :photographer, :totalpages, :format, :editor, :editionyear, :editora, :isbn, :binding, :realisation, :designer, :correction, :clasification, :content, :banner, :troquelado, :collecttion)
    end
end
