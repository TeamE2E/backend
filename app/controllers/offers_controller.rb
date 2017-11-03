class OffersController < ApplicationController
  before_action :authenticate_user!

  def index
    puts current_user.to_json
  end
end
