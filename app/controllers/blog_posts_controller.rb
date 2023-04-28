class BlogPostsController < ApplicationController
    def index
        @blog_posts = BlogPost.all #instance variables are available in the view
    end

    def show
        @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
            redirect_to blog_post_path(@blog_post)
        else
            render :new, status: :bad_request
        end
    end

    #edit blog post
    def edit
        @blog_post = BlogPost.find(params[:id])
    end

    #update blog post
    def update
        @blog_post = BlogPost.find(params[:id])
        if @blog_post.update(blog_post_params)
            redirect_to blog_post_path(@blog_post)
        else
            render :edit, status: :bad_request
        end
    end

    private
    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end
end