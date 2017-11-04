require 'google_maps_service'

# Setup global parameters
GoogleMapsService.configure do |config|
  config.key = 'AIzaSyDzKU1PkKFOtQd9lr1Zbkjxqheqpqe5hNg'
  config.retry_timeout = 20
  config.queries_per_second = 10
end
