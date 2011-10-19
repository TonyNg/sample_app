Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '277837072250527', 'f0c0b9b7c6821722d70e2f0275c6b3dd'
end
