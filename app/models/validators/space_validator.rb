class SpaceValidator < ActiveModel::Validator
	DEFAULT_SCOPE = %i[mongoid errors models space attributes].freeze

	def validate(record)
		phone_scope = [DEFAULT_SCOPE].flatten
		phone_scope << :phone

		record.errors.add(:phones, I18n.t(:blank, scope: phone_scope)) unless record.phones.any?
		record.errors.add(:phones, I18n.t(:taken, scope: phone_scope)) if duplicated_phone?(record.phones.last, record.phones)
	end

	private

	def duplicated_phone?(entry, list)
		return false unless list.count > 1 && entry.present?

		duplicated = list.select { |item| item == entry }
		duplicated.count >= 2
	end
end
