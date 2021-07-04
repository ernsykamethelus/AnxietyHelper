class BlogsController < ApplicationController
    before_action :require_user
    def new 
        @blog = Blog.new 
    end

    def about 
    end

end