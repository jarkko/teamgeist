# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_teamgeist_session',
  :secret      => 'df0ffeb45be5cc2e08c15d2be80498d444241946265938fca6e9d815533cba71461ea8be089abef4523a9f6a7a88b79871634f472167592b1f56228c2344be35'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
