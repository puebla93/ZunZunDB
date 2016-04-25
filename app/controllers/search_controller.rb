class SearchController < ApplicationController
  def index
    @tables = [["Articles",1], ["Book",2],["Employees",3],["Magazines",4]]
  end
  def search
    #params[]
    #redirect_to(articles_path(fo: :df))
  end
end
