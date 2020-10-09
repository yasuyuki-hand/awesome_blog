class StaticPagesController < ApplicationController
  def home
    #1. check if user is logged in
    if logged_in?
      #2. Create micropost if there is current_user
      @micropost = current_user.microposts.build

      #feed_items -> shows your microposts in Home page
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 12)


      #3. You can see micoposts of others, others can see your micropost
      # Yutaka wants to look at Hotaka's posts
      # Yutaka -> current_user (user ID: 1)
      # Hotaka -> other_user(user Id: 40)
      @user = current_user
    end
  end

  def about
  end

  def contact
  end
end
