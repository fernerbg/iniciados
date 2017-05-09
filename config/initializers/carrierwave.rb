CarrierWave.configure do |config|
  # These permissions will make dir and files available only to the user running
  # the servers
  # config.permissions = 0600
  # config.directory_permissions = 0700

  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJOTVGC5PA7PMYTGQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'us-east-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'skyiniciados-dev'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  #config.root = Rails.root
end