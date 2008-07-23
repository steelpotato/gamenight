class HomeController < ApplicationController
  layout 'standard'
  def index
    @categories = Category.find(:all)
  end
end
