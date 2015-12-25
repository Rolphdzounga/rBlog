class PostsController < ApplicationController
  def index
    @categories = Category.all
  	if params[:search]
      @posts = Post.all.order('created_at desc').paginate(:per_page => 2, :page => params[:page]) 
    else
      @posts = Post.all.order('created_at desc').paginate(:per_page => 1, :page => params[:page]) 
    end
  	
  end

  def show
  	@post = Post.find(params[:id])
  	@comments = Comment.all
  	@comment = Comment.new
  	@categories = Category.all
    @u = @post.usr
  end
end
