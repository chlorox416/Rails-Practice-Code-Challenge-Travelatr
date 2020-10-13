class BloggersController < ApplicationController
  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to blogger_path(@blogger)
    else
      #flash[:errors] = @blogger.errors.full_messages
      render 'new'
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def index
    @bloggers = Blogger.all
  end

  private

  def blogger_params
    params.require(:blogger).permit(
      :name,
      :bio,
      :age
    )
  end
end
