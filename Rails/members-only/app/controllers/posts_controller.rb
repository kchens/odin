class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create]

	def index
		@posts = Post.all
	end

	def new
	end

	def create
		#automatically creates a post with the author's foreign key
		@post = current_user.posts.build(note: current_user[:id])
		redirect_to posts_path if @post.save #post/index.html.erb
	end

	def destroy
	end

	private

	def signed_in_user
		redirect_to signout_path, notice: "Please sign in." unless signed_in?
	end
end