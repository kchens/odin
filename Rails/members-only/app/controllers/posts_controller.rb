class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create]


	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		#automatically creates a post with the author's foreign key

		@post = Post.new(post_params)
		@post.user_id = current_user.id
		puts "This is #{@post.user_id} user"
		puts "#{@post.errors.full_messages}"
		if @post.save #post/index.html.erb
			redirect_to posts_path
		else
			redirect_to new_post_path
		end

		# Two ways to associate user_id
		# 1)
		# @post = Post.new  -- in #new
		# @post.user_id = current_user.id  -- in #create
		# 2)
		# @post = current_user.posts.build  -- in #create
	end

	def destroy
	end

	private

	def post_params
		params.require(:post).permit(:note)
	end

	def signed_in_user
		redirect_to signout_path, notice: "Please sign in." unless signed_in?
	end
end