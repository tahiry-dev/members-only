class PostsController < ApplicationController
    def index
        @messages = Post.all
    end

    def new
      @message = current_user.posts.build
    end

    def show
        @message = Post.find(params[:id])
    end

    def create
      @message = current_user.posts.build(post_params)
  
      respond_to do |format|
        if @message.save
          format.html { redirect_to posts_path, notice: 'Your message was successfully posted.' }
        else
          format.html { render :new }
        end
      end
    end

    def post_params
        params.require(:post).permit(:title, :message)
    end
end
