# :nocov:

# Although it has a test and it is covering all it's methods, I can't include this on simplecov,
# because it is loaded after the simplecov starts, so it is not tracked.
require 'simplecov'
require 'httparty'

# Include the coverage reported by simplecov to a shield
class SimpleCov::Formatter::Shield
	CONST_URL = 'https://img.shields.io/badge'.freeze

	class << self
		attr_accessor :options
		attr_accessor :style
	end

	@options = {
		label: { value: 'Test Coverage' },
		decimals: { value: 2 },
		style: { value: nil },
		coverage: {
			high: 90,
			medium: 60,
			low: 0
		},
		common_colors: { enabled: true },
		custom_color: {
			high: '28a745',
			medium: 'FFEBA3',
			low: '#C65235'
		},
		colors: {
			high: 'brightgreen'.freeze,
			medium: 'yellow'.freeze,
			low: 'red'.freeze
		}
	}

	# Function required to implement a new formatter
	def format(data)
		@data = data
		create
	end

	private

	def covered_percent
		@covered_percent ||= @data.covered_percent.round(decimals[:value])
	end

	def create
		File.open(save_file_on, 'w') { |file| file.write fetch_shield }
	end

	def save_file_on
		"#{Rails.root}/lib/assets/simplecov.svg"
	end

	def fetch_shield
		HTTParty.get(build_url).parsed_response
	end

	def build_url
		url = "#{CONST_URL}/#{label[:value].tr(' ', '_')}-#{covered_percent}%25-#{apply_common_color}.svg"
		url << apply_custom_color unless common_colors[:enabled]
		url << apply_style
		url
	end

	def apply_style
		choosed_style = fetch_key

		case style[:value]
		when :big
			choosed_style << 'style=for-the-badge'
		when :flat
			choosed_style << 'style=flat'
		else
			choosed_style = ''
		end

		choosed_style
	end

	def apply_common_color
		colors[define_quality]
	end

	def apply_custom_color
		"?colorB=%23#{custom_color[define_quality]}"
	end

	def fetch_key
		return '?' if common_colors[:enabled]

		'&'
	end

	def define_quality
		return :high if covered_percent.between?(coverage[:high], 100)
		return :medium if covered_percent.between?(coverage[:medium], coverage[:high])

		:low
	end

	@options.to_h.each { |key, value| define_method(key) { value } }
end
# :nocov:
