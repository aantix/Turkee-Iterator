# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_turkee_iterator_session',
  :secret      => '97e36d1f2c1e590252150432f5d2efbbbdf69ccd8c3d39c6dce6343a636b0ae2ad8bac0d806e27bd729c4651c748e48272497d802fd53fa6dc6e3a859c9677da'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
