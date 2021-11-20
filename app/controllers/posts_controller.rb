class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            flash.notice= 'all good'
            redirect_to '/posts'
        else
            flash.alert= 'something went wrong'
            render :new
        end
    end

    def post_params
        params.require(:post).permit(
        :title,
        :help,
        :description,
        :marktsegment,
        :keywords
        )
    end
    
    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash.notice = "post updated"
            redirect_to  posts_path
        else
            flash.alert = 'Could not update post'
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            flash.notice = "post deleted"
            redirect_to posts_path
        else 
            flash.alert = "Could not delete Post"
            ridirect_to posts_path
        end
    end
    
    def show
        @post = Post.find(params[:id])
    end
end