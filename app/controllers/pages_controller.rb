class PagesController < ApplicationController
  layout "boot_simple"
  
  def index
    do_sharethis
    @is_front_page = true
  end
  
  def handout
    # disable layout
    @is_front_page = true
    @hide_copyright = true
  end
end
