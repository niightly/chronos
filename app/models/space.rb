class Space
	include Mongoid::Document
	include Mongoid::Timestamps

	field :name, type: String
	field :email, type: String
	field :cnes, type: String
	field :phones, type: Array, default: []

	belongs_to :address, class_name: 'Address'

	validates_presence_of %i[name email cnes]
	validates :name, uniqueness: { scope: %i[name cnes] }

	validates_with PhoneValidator
end
