module CorsConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_white_listed_domains
  end

  def set_white_listed_domains
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://www.devcamp.space'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
      end

      allow do
        origins ['http://localhost:3000', 'http://localhost:8000']
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
      end

      allow do
        origins ClientDomain.all.pluck(:url)
        puts "client domains" * 500, ClientDomain.all.pluck(:url), "client domains" * 500
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
      end
    end
  end
end
