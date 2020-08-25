if ActiveRecord::Base.connection.data_source_exists? 'spree_authentication_methods'
  Spree::AuthenticationMethod.where(environment: Rails.env, provider: 'facebook').first_or_create do |auth_method|
    auth_method.api_key = ENV['FACEBOOK_APP_ID']
    auth_method.api_secret = ENV['FACEBOOK_APP_SECRET']
    auth_method.active = true
  end
  Spree::AuthenticationMethod.where(environment: Rails.env, provider: 'google_oauth2').first_or_create do |auth_method|
    auth_method.api_key = ENV['GOOGLE_APP_ID']
    auth_method.api_secret = ENV['GOOGLE_APP_SECRET']
    auth_method.active = true
  end
end
