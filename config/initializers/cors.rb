Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://www.devcamp.space'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origins 'https://devcamp.space'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origins ['http://localhost:3000',
             'http://localhost:3002',
             'http://localhost:3008',
             'http://localhost:5000',
             'http://localhost:8080']
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origins do |origin|
      ClientDomain.all.pluck(:url).include?(origin)
    end
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end
