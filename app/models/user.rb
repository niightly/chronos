class User
	include Mongoid::Document
	include Mongoid::Timestamps

	field :type, type: Symbol, default: :user
	field :name, type: String
	field :email, type: String
	field :cpf, type: String
	field :gender, type: Symbol
	field :phones, type: Array

	validates :type, inclusion: %i[employee user]
	validates :gender, inclusion: %i[male female]
	validates_presence_of %i[name email]
	validates_presence_of :cpf, if: :employee?
	validates_format_of :email, with: %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z}i
	validates_with PhoneValidator
	validates_uniqueness_of :email

	belongs_to :address, class_name: 'Address'

	private

	def employee?
		type == :employee
	end
end
