class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_param)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_param)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
    def post_param
      params.require(:post).permit(:title, :content)
    end
end
