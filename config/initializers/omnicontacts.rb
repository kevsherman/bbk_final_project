require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, ENV["GMAIL_KEY"], ENV["GMAIL_SECRET"]
  #importer :yahoo, "consumer_id", "consumer_secret", {:callback_path => '/callback'}
  #importer :hotmail, "client_id", "client_secret"
  importer :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"]
end
