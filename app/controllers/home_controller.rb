class HomeController < ApplicationController
  def index
  end

  before_filter :authenticate_user!
end
