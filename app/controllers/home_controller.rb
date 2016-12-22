class HomeController < ApplicationController
  def index
  end

  def about
    @current_page = 'about'
  end
end
