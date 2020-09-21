class UsersController < ApplicationController

  def index
  end

  # def create
  # end

  def new
    User.new
  end

  private

  
end
