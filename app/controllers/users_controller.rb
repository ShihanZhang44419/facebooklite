class UsersController < ApplicationController

     
  def index
    @users = User.all
    @liposts = Course.all
  end
  

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
     
      @getEmail = current_user.facebook.get_object("me",fields:'email')
        @user_email = @getEmail['email']
      @getPic = current_user.facebook.get_picture("me")
      @getLast_name = current_user.facebook.get_object("me",fields:['last_name'])
      @user_last_name = @getLast_name['last_name']
   
      @litposts = current_user.litposts.paginate(page: params[:page], :per_page => 6)
    else
      @litposts = @user.litposts.paginate(page: params[:page], :per_page => 6)
    
    end
    
    @following = @user.all_following
    @follower = @user.followers
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Course App!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  def follow
  @user = User.find(params[:id])
  if current_user
    if current_user == @user
      flash[:error] = "You cannot follow yourself."
    else
      current_user.follow(@user)
      flash[:notice] = "You are now following #{@user.name}."
      redirect_back(fallback_location: @user)
    end
  end
  end
  
  def unfollow
  @user = User.find(params[:id])
  if current_user
    current_user.stop_following(@user)
    flash[:notice] = "You are no longer following #{@user.name}."
    redirect_back(fallback_location: @user)
  end
  end
  
  def activities
    @user_follower = current_user.followers.count
    @user_following = current_user.follows.count
  
  end
  
  
  private
  
    def user_params
      params.require(:user).permit(:name)
    end 
  
  
end

#first_name => u.facebook.get_object("me",fields:['first_name'])
#last_name => u.facebook.get_object("me",fields:['last_name'])
#birthday => u.facebook.get_object("me",fields:['birthday'])
#profile_pic => u.facebook.get_object("me",fields:['picture'])