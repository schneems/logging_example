# Be sure to restart your server when you modify this file.

# LoggingExample::Application.config.session_store :cookie_store, key: '_logging_example_session'

Rails.application.config.session_store :active_record_store, :key => "_logging_example_session"

ActiveRecord::SessionStore::Session.attr_accessible :data, :session_id
