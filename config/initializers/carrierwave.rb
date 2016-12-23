#CarrierWave.configure do |config|
  # These permissions will make dir and files available only to the user running
  # the servers
  # config.permissions = 0600
  # config.directory_permissions = 0700
#  if Configuration['AWS_id']
#    config.fog_credentials = {
#      :provider               => 'AWS',       # required
#      :aws_access_key_id      => Configuration['AWS_id'],       # required
#      :aws_secret_access_key  => Configuration['AWS_secret'],       # required
#      :region                 => 'us-west-2'  # optional, defaults to 'us-east-1'
#    }
    
#    config.fog_directory = Configuration['S3_bucket_dev']
#  end
  #config.fog_public = false
  
  #config.use_action_status = true
  
  # This avoids uploaded files from saving to public/ and so
  # they will not be available for pubsadflic (non-authenticated) downloading
#  config.root = Rails.root
#end