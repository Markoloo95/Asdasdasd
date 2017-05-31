class PostsController < ApplicationController

  def new
    @post = Post.new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def index
    @post = Post.all

  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(permit_post)
    if @post.save
        flash[:success] = "Siker!"

        redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path


    end
  end

  def destroy
    @post.destroy
    flash[:danger] = "Törölve!"
    redirect_to new_post_path
  end

    private

      def permit_post
          params.require(:post).permit(:image,:description)
      end

end
