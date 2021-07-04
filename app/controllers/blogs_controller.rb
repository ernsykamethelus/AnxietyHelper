class BlogsController < ApplicationController
    # before_action :require_user
    def new 
        @blog = Blog.new 
    end

    # def index 
    #     @blogs = Blogs.alpha
    # end

    def about 
    end

end