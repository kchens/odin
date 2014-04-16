class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(name: params[:session][:name].downcase)
		if @user != nil
			sign_in(@user)
			redirect_to @user
		else
			flash.now[:error] = "Name not found"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to new_session_path
	end
end