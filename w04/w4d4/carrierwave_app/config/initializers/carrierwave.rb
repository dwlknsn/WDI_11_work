CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :aws_access_key_id  => ENV['AWS_ACCESS_KEY_ID_WDI_11'],  # required
    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY_WDI_11'],  # required
    :region  => 'eu-west-1',  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['WDI_11_AWS_WDI_S3_BUCKET']  # required
  config.fog_public  = true  # optional, defaults to true
end