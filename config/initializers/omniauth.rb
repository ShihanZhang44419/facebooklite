OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '2655276914518045', '9de14ef79a9bdb736bb826711217a054'
end