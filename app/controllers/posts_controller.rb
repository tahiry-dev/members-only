class PostsController < ApplicationController
    def index
        @messages = Post.all
    end

    def new
        @message = Post.new
    end

    def show
        @message = Post.find(params[:id])
    end

    def create
        @message = params.require(:post).permit(:title, :message)
        if @message.save
            flash[:success] = "your post has been created successfully"
            redirect_to posts_path
        else
            render :new
        end
    end
end
