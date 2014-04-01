class UsersController < ApplicationController

	def index
		@index = "This is index"
	end

	def show
		@show = "This is show"
	end

	def new
		@new = "This is new"
	end

	def edit
		@edit = "This is edit"
	end

	def create
		@create = "This is create"
	end
end
