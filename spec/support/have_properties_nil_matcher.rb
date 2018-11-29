RSpec::Matchers.define :have_nil_attributes do
 match do |responses|
  if responses.is_a? Array
   responses.map do |response|
    response.instance_variables.each do |_var|
     value = response.send :instance_variables
     return true if value.nil?
    end
   end
  elsif responses.is_a? Struct
   responses.to_h.values.flatten.each { |value| return true if value.nil? }
  else
   responses.instance_variables.each do |_response|
    value = responses.send :instance_variables
    return true if value.nil?
   end
  end

  false
 end
end
