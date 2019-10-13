if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :region                => 'ap-southeast-2',
      :aws_access_key_id     => 'AKIAROIXOOTMEU3Q72F3',
      :aws_secret_access_key => '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'
    }
    config.fog_directory     =  'cc2019-group84'
    config.fog_provider = 'fog/aws'
  end
end