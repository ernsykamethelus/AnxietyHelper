class BlogsController < ApplicationController
    before_action :require_user
    
    def index 
        @blogs = Blogs.alpha
    end

    def about 
    end

end