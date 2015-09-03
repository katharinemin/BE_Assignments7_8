class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]


	# view all posts
	def index

		@posts = Post.all
	end

	# show view in post
	
	def show
        @post = Post.find(params[:id])
    end

		#@post = Post.where(id: params[:id]).first
		# also could be a find
 	def new
    @post = Post.new
 	end
 
  	def create
   		@post = Post.new(post_params)

  		respond_to do |format|
      		if @post.save
        	format.html { redirect_to @post, notice: 'Post was successfully created!' }
      		else
        	format.html { render :new }
      		end
    	end
  	end


  	# DELETE /posts
  	def destroy
 		@post = Post.find params[:id]
 		@post.destroy

 		redirect_to posts_path, :notice => "Your post has been deleted!"
  	end

	private

    def set_post
      @post = Post.find(params[:id])
    end

    
    def post_params
      params.require(:post).permit(:title, :body)
    end
end



