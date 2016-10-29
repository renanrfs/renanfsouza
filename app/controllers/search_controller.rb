class SearchController < ApplicationController
	
	def index
	  if params[:q].nil?
	    @articles = Article.all
	  else
	    @articles = Article.search(params[:q])
	  end
	end
end
