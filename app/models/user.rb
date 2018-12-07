require 'bcrypt'

class User
	include Mongoid::Document
	include Mongoid::Timestamps
	include BCrypt

	field :type, type: Symbol, default: :user
	field :name, type: String
	field :email, type: String
	field :cpf, type: String
	field :gender, type: Symbol
	field :phones, type: Array
	field :encrypted_password, type: String

	validates :type, inclusion: %i[employee user]
	validates :gender, inclusion: %i[male female]
	validates_presence_of %i[name email gender encrypted_password]
	validates_presence_of :cpf, if: :employee?
	validates_format_of :email, with: %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z}i
	validates_with PhoneValidator
	validates_uniqueness_of :email

	belongs_to :address, class_name: 'Address'

	def password
		@password ||= Password.new("#{Rails.application.credentials[:bcrypt][:salt]}#{encrypted_password}")
	end

	def password=(new_password)
		@password = Password.create("#{Rails.application.credentials[:bcrypt][:salt]}#{new_password}")
		self.encrypted_password = @password
	end

	def authenticated?(pass)
		password == "#{Rails.application.credentials[:bcrypt][:salt]}#{pass}"
	end

	private

	def employee?
		type == :employee
	end
end
