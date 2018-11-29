require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
	config.redis = { url: Rails.application.credentials[Rails.env.to_sym][:redis][:uri] }

	config.on(:startup) do
		Sidekiq.schedule = YAML.load_file(File.expand_path("#{Rails.root}/config/initializers/sidekiq_scheduler.yml", __FILE__))
		SidekiqScheduler::Scheduler.instance.reload_schedule!
	end
end

Sidekiq.configure_client do |config|
	config.redis = { url: Rails.application.credentials[Rails.env.to_sym][:redis][:uri] }
end

if Rails.env.production?
	Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
		sidekiq = Rails.application.credentials[Rails.env.to_sym][:sidekiq]
		[user, password] == [sidekiq[:user], sidekiq[:password]]
	end
end
