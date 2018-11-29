# Main controller of the application
class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	skip_before_action :verify_authenticity_token, if: :api?

	# add_breadcrumb 'Home', '/'

	protected

	def api?
		klass = self.class.to_s
		klass.include?('Api::')
	end
end
