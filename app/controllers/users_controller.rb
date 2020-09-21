class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create


  def new
    User.new
  end

  private
  
  
  
end
