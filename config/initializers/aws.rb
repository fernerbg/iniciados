Aws.config.update({
  region: 'us-west-2',
  credentials: Aws::Credentials.new(Configuration['AWS_id'], Configuration['AWS_secret']),
})

#S3_BUCKET = Aws::S3::Resource.new.bucket(Configuration['S3_bucket_dev'])