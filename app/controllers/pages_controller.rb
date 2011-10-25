class PagesController < ApplicationController

  def home
    @title = "Home"
    if signed_in?
	  redirect_to users_path
      
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def help
	@title = "Help"
  end

  def index
	@title = "Index"
	@micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
  end
end