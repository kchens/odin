class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # include SessionsHelper


  def sign_in(user)
  	remember_token = User.new_remember_token  	
  	cookies.permanent[:remember_token] = remember_token
  	user.update_attributes(remember_token: User.hash(remember_token))
  	current_user = user
  end

  def current_user
  	#pulls token from browser, then hashes it
  	remember_token = User.hash(cookies[:remember_token]) 
  	@current_user ||= User.find_by(cookies[remember_token: remember_token])
  end

  def current_user=(user)
  	@current_user = user 
  end

  def sign_out
  	current_user.update_attributes(remember_token:
  							User.hash(User.new_remember_token))
  	cookies.delete(:remember_token)
  	self.current_user = nil
  end

  def signed_in?
  	!current_user.nil?
  end
end

def sign_in
  remember_token = User.new_remember_token
  cookies.permanent[:remember_token] = remember_token
  user.update_attributes(remember_token: User.hash(remember_token))
  current_user = user
end