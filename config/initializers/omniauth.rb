Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :facebook, ENV['253033765735907'], ENV['c7a751e652582a03f7e11b28c69eece0']
end