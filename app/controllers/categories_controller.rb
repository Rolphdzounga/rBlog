class CategoriesController < ApplicationController
  def show
  	@categories = Category.all
  	@category = Category.find(params[:id])
  	@posts = @category.posts
  end

  def index
  	if params[:search]
      @categories = Category.search(params[:search]).all.order('created_at desc').paginate(:per_page => 2, :page => params[:page]) 
    else
      @categories = Category.all.order('created_at desc').paginate(:per_page => 2, :page => params[:page])
    end
  	@categories = Category.all
  end
end
