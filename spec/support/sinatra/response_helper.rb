require 'sinatra/base'

# Include a helper to Sinatra Base
module Sinatra
 # Creates a method to be used across all stubs over the application
 module ResponseHelper
  def json_response(response_code, content_type, file_name)
   content_type content_type
   status response_code
   File.open("#{Rails.application.root}/spec/support/fixtures/#{file_name}", 'rb').read
  end
 end

 helpers ResponseHelper
end
