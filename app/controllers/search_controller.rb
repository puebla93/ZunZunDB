class SearchController < ApplicationController
  before_action :set_var, only: [:index]

  def index
  end

  def search
    # tables = "Artículos" -> 1, "Empleados" -> 2, "Libros" -> 3, "Revistas" -> 4

    selected = params[:selected]
    if selected == '1'
      redirect_to(articles_path(params))
    elsif selected == '2'
      redirect_to(employees_path(params))
    elsif selected == '3'
      redirect_to(books_path(params))
    elsif selected == '4'
      redirect_to(magazines_path(params))
    end
  end

  private
    def set_var
      @employees = Employee.all.map{|u| [u.name, u.name]}
      @magazines = Magazine.all.map{|u| [u.number, u.number]}
    end
end
