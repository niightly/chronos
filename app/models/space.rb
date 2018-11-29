class Space
	include Mongoid::Document
	include Mongoid::Timestamps

	field :name, type: String
	field :email, type: String
	field :cnes, type: String
	field :phones, type: Array, default: []

	validates_presence_of :name, :email, :cnes
	validates :name, uniqueness: { scope: [:name, :cnes] }
	validates_with SpaceValidator
end
