if Rails.application.credentials.aws
  CarrierWave.configure do |config|
    if Rails.env.production?
      config.storage = :fog
      config.fog_provider = 'fog/aws'
      config.fog_directory = Rails.application.credentials.aws.bucket_name
      config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: Rails.application.credentials.aws.access_key_id,
        aws_secret_access_key: Rails.application.credentials.aws.secret_access_key,
        region: 'ap-northeast-1',
        path_style: true
      }
    else
      config.storage = :file
      config.enable_processing = false if Rails.env.test?
    end
  end
end
