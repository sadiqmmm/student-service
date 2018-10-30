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
    origins do |origin|
      ClientDomain.all.pluck(:url).include?(origin)
    end
    puts "client domains" * 500, ClientDomain.all.pluck(:url), "client domains" * 500
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end
