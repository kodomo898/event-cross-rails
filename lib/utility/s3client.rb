module Utils
    class S3client
        def self.upload_user_image(file, user_name)
           @s3.put_object(
               bucket: ENV['bucket_name'],
               body: file,
               key: user_name + ".jpg"
           )
        end
    end
end
