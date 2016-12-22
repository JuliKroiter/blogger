class HomeController < ApplicationController
  def index
  end

  def about
    @current_page = 'about'
  end

  def partners
    @current_page = 'partners'
  end
end
