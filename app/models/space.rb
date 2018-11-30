class Space
	include Mongoid::Document
	include Mongoid::Timestamps

	field :name, type: String
	field :email, type: String
	field :cnes, type: String
	field :phones, type: Array, default: []

	field :street, type: String
	field :number, type: String
	field :postal_code, type: String
	field :complement, type: String
	field :neighborhood, type: String
	field :city, type: String
	field :state, type: String

	embeds_one :address, class_name: 'Address', autobuild: true

	validates_presence_of %i[name email cnes street number postal_code neighborhood city state]
	validates :name, uniqueness: { scope: %i[name cnes] }
	validates :street, uniqueness: { scope: %i[street number postal_code neighborhood city state] }

	validates_with SpaceValidator
end
