class PagesController < ApplicationController
  layout "boot_simple"
  
  def index
    do_sharethis
  end
end
