if Rails.env.production?
  # CarrierWave.configure do |config|
  #   config.fog_credentials = {
  #     # Configuration for Amazon S3
  #     :provider              => 'AWS',
  #     
  #     :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
  #     :aws_secret_access_key => ENV['S3_SECRET_KEY']
  #   }
  #   config.fog_directory     =  ENV['S3_BUCKET']
  #   config.fog_provider = 'fog/aws'
  # end

 CarrierWave.configure do |config|
    config.storage    =  :aws                  # required
    #config.aws_region =  'ap-southeast-2'
    config.aws_bucket =  ENV['S3_BUCKET']     # required
    config.aws_acl    =  :public_read

    config.aws_credentials = {
      :region                => 'ap-southeast-2',
      access_key_id:      ENV['S3_ACCESS_KEY'],     # required
      secret_access_key:  ENV['S3_SECRET_KEY']    # required
    }
    
  end
end