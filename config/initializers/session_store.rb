# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_emd_session',
  :secret      => 'e7ca8f4fdab8d783a80eec27f837caaf7693fa53704b42c485fcba37bfe12688cc937382b1b80200e118e4e9f3145c2663a9c8884cf209aa4779e1971f23e371'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
