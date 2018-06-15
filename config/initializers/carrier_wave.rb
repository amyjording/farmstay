require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['aws_access_key_id'],
      :aws_secret_access_key => ENV['aws_secret_access_key'],
      :region          => ENV['aws_region']
    }
    config.fog_directory     =  ENV['aws_bucket']
  end
end

CarrierWave.configure do |config|
  config.asset_host = ActionController::Base.asset_host
end 