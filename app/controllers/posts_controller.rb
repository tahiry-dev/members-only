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
        @message = current_user.posts(params.require(:post).permit(:title, :message))
        if @message.save
            flash[:success] = "your post has been created successfully"
            redirect_to posts_path
        else
            render :new
        end
    end
end
