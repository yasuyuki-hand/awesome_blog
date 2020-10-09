class MicropostsController < ApplicationController
    before_action :only_loggedin_users, only: [:create, :destroy]

    def create
        # seeds.rb -> .create (User.create)
        # User (is the parent) -> user.save
        # current_user.microposts (user can create MANY microposts) -> .build (because there is relationship)
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            redirect_to root_url
        else
            #Collection: -> in_feed.html.erb will get all micropost and show it here in the []
            # 1. Create Micropost
            # 2. Save in Database
            # 3. Displays in User show page
            # 4. Displays in Home Page because of @feed_items = []
            @feed_items = []
            redirect_to root_url
        end #end of if

        # respond_to do |format|
        #     format.html { redirect_to @micropost }
        #     format.js
        # end
    end #end of method

    def destroy
        Micropost.find(params[:id]).destroy
        redirect_to root_url

        # respond_to do |format|
        #     format.html { redirect_to @micropost }
        #     format.js
        # end
    end

    def uplike
        @micropost = Micropost.find(params[:id])
        @micropost.likes.create

        redirect_to root_url
    end
   

    private
    def micropost_params
        params.require(:micropost).permit(:content)
    end

end
