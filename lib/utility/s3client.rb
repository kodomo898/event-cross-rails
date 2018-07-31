module Utils
    class S3client
        def initialize()
          Aws.config[:credentials] = Aws::Credentials.new(ENV['access_key_id'], ENV['secret_access_key'])
          Aws.config[:region] = ENV['region']
          @s3 = Aws::S3::Client.new
        end

        def upload_user_image(file, user_name)
            @s3.put_object(
                bucket: ENV['bucket_name'],
                body: file,
                key: user_name + ".jpg"
            )
        end
    end
end
