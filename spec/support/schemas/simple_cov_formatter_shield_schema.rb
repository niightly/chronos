module SimpleCovFormatterShieldSchema
  def self.schema
    {
      type: 'object',
      required: %w[label decimals style coverage common_colors custom_color colors],

      properties: {
        label: {
          type: 'object',
          required: %w[value],

          properties: {
            value: { type: 'string' }
          }
        },
        decimals: {
          type: 'object',
          required: %w[value],

          properties: {
            value: { type: 'number' }
          }
        },
        style: {
          type: 'object',
          required: %w[value],

          properties: {
            value: { type: 'string' }
          }
        },
        coverage: {
          type: 'object',
          required: %w[high medium low],

          properties: {
            high: { type: 'number' },
            medium: { type: 'number' },
            low: { type: 'number' }
          }
        },
        common_colors: {
          type: 'object',
          required: %w[enabled],

          properties: {
            enabled: { type: 'boolean' }
          }
        },
        custom_color: {
          type: 'object',
          required: %w[high medium low],

          properties: {
            high: { type: 'string' },
            medium: { type: 'string' },
            low: { type: 'string' }
          }
        },
        colors: {
          type: 'object',
          required: %w[high medium low],

          properties: {
            high: { type: 'string' },
            medium: { type: 'string' },
            low: { type: 'string' }
          }
        }
      }
    }
  end

  def self.sample
    <<-EOS
		{
			"label": { "value": "Coverage" },
			"decimals": { "value": 2 },
			"style": { "value": "flat" },
			"coverage": {
				"high": 90,
				"medium": 60,
				"low": 0
			},
			"common_colors": { "enabled": false },
			"custom_color": {
				"high": "#28a745",
				"medium": "#FFEBA3",
				"low": "#C65235"
			},
			"colors": {
				"high": "brightgreen",
				"medium": "yellow",
				"low": "red"
			},
		}
		EOS
  end
end
