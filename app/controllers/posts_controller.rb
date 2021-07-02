class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :show, :destroy]

    def new 
        @post = Post.new 
    end

    def create 
        # render plain: params[:post].inspect
        @post = Post.new(post_params)
        @post.user = User.first 
        if @post.save 
            flash[:sucess] = "Post was successfully created"
        redirect_to post_path(@post)
        else 
            render 'new'
    end
end

    def show 
        # @post = Post.find(params[:id])
    end

    def edit 
        # @post = Post.find(params[:id])
    end

    def update 
        # @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:sucess] = "Post was successfully updated."
            redirect_to post_path(@post)
        else 
            flash[:sucess] = "Post was not successfully updated."
            render 'edit'
        end
    end

    def index 
        @posts = Post.all
    end

    def destroy
        # @post = Post .find(params[:id])
        @post.destroy 
        flash[:sucess] = "Post was deleted"
        redirect_to posts_path
    end

    private 
    def post_params
        params.require(:post).permit(:title, :description)
    end

    def set_post
        @post = Post .find(params[:id])
    end
end