###
#AWS config initiarized

Aws.config[:credentials] = Aws::Credentials.new(ENV['access_key_id'], ENV['secret_access_key'])
Aws.config[:region] = ENV['region']

@s3 = Aws::S3::Client.new
