class MicropostsController < ApplicationController
 before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def like
	@current_user = User.first
	@micropost = micropost.find(params[:id])
	@current_user.flag(@micropost, :like)
	redirect_to home_path, :notice => "you now like this"
	end
	
   def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Blurb posted!"
	  redirect_to root_path 
    else
      @feed_items = []
      render 'pages/home'
    end
  end

 def destroy
    @micropost.destroy
    redirect_back_or root_path
  end
  
  private
  
   def authorized_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
  
end
