class WelcomeController < ApplicationController
  def index
    render json: {msg: 'Yay! You are on Rails!'}
  end
end
