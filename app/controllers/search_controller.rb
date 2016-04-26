class SearchController < ApplicationController
  def index
    @tables = [["Artículos",1], ["Empleados",2],["Libros",3],["Revistas",4]]
  end
  def search
    selected = params[:selected]
    if selected == '1'
      redirect_to(articles_path(params))
    elsif selected == '2'
      redirect_to(employees_path(params))
    elsif selected == '3'
      redirect_to(books_path(params))
    else
      redirect_to(magazines_path(params))
    end
  end
end
