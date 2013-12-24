class PagesController < ApplicationController
  layout "simple"
  
  def index
    do_sharethis
  end
end
