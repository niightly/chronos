require 'sinatra/base'

# Provide a stub to be used as data when call the API
class ShieldIoStub < Sinatra::Base
 helpers Sinatra::ResponseHelper

 get(%r{(\/badge\/Test%20Coverage\-*.*.svg)}) do
  json_response 200, :svg, 'simple_cov_shield.svg'
 end
end
