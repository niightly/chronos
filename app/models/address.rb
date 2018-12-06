class Address
	include Mongoid::Document
	include Mongoid::Timestamps

	field :street, type: String
	field :number, type: String
	field :postal_code, type: String
	field :complement, type: String
	field :neighborhood, type: String
	field :city, type: String
	field :state, type: String

	has_one :space, class_name: 'Space'
	has_one :user, class_name: 'User'

	validates_presence_of %i[street number postal_code neighborhood city state]
	validates :street, uniqueness: { scope: %i[street number postal_code neighborhood city state] }
end
