class PostsController < ApplicationController
  before_action :select_post, only: [:edit, :update, :show, :liked]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render 'edit'
    end
  end

  def show
  end

  def index
    @posts = Post.all
  end

  def liked
    @post.increment!(:likes)
    redirect_to post_path(@post)
  end
    
  
  private

  def select_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :likes,
      :blogger_id, 
      :destination_id
    )
  end


end
