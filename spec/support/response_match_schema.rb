RSpec::Matchers.define :response_match_schema do |schema, params|
	match do |response|
		params = {} if params.nil?
		JSON::Validator.validate!(schema.to_s.safe_constantize.schema, response, params)
	end
end
