class LitpostsController < ApplicationController
    before_action :correct_user,   only: :destroy
    def index
    @user = User.all
    #  @getEmail = current_user.facebook.get_object("me",fields:'email')
    #  @user_email = @getEmail['email']
    #  @getPic = current_user.facebook.get_picture("me")
    #  @getFirst_name = current_user.facebook.get_object("me",fields:['first_name'])
    #  @user_first_name = @getFirst_name['first_name']
   
     #display page number
     @litposts = Litpost.all.paginate(page: params[:page], :per_page => 6)
     
     #post new status
     @litpost = current_user.litposts.build
    end 
    
    
    def new 
        @litpost = Lipost.new
    end
    
    def create
    #create new post
    @litpost = current_user.litposts.build(litpost_params)
      if @litpost.save
       flash[:success] = "Status created!"
       redirect_to litposts_path
      end 
     
    end
    
    
    def destroy
         @litpost.destroy
        flash[:success] = "Status deleted"
        redirect_to litposts_path
    end
    
    private
        
        def litpost_params
            params.require(:litpost).permit(:content)
        end   
        
        def correct_user
            @litpost = current_user.litposts.find_by(id: params[:id])
            redirect_to root_url if @litpost.nil?
        end
    
end
