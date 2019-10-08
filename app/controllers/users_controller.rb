class UsersController < ApplicationController

  def index
    
  end
  
  
  def show
    @getEmail = current_user.facebook.get_object("me",fields:'email')
      @user_email = @getEmail['email']
    @getPic = current_user.facebook.get_picture("me")
    @getFirst_name = current_user.facebook.get_object("me",fields:['first_name'])
    @user_first_name = @getFirst_name['first_name']
  end
  
  def new
    
  end
  
end

#first_name => u.facebook.get_object("me",fields:['first_name'])
#last_name => u.facebook.get_object("me",fields:['last_name'])
#birthday => u.facebook.get_object("me",fields:['birthday'])
#profile_pic => u.facebook.get_object("me",fields:['picture'])