require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
	mount Sidekiq::Web, at: '/sidekiq'
end
