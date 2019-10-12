OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '2655276914518045', '9de14ef79a9bdb736bb826711217a054', 
                                           scope: "email,public_profile,user_friends,user_gender,user_photos,user_posts,user_likes,user_birthday,user_events,manage_pages,publish_pages"
end