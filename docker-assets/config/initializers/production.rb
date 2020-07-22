if Rails.env.production?
  # Lobsters::Application.config.middleware.use ExceptionNotification::Rack,
  #   :ignore_exceptions => [
  #     "ActionController::UnknownFormat",
  #     "ActionController::BadRequest",
  #     "ActionDispatch::RemoteIp::IpSpoofAttackError",
  #   ] + ExceptionNotifier.ignored_exceptions,
  #   :email => {
  #     :email_prefix => "[site] ",                    # fill in site name
  #     :sender_address => %{"Exception Notifier" <>}, # fill in from address
  #     :exception_recipients => %w{},                 # fill in destination addresses
  #   }

  # Pushover.API_TOKEN = "secret"
  # Pushover.SUBSCRIPTION_CODE = "secret"

  # StoryCacher.DIFFBOT_API_KEY = "secret"

  # Twitter.CONSUMER_KEY = "secret"
  # Twitter.CONSUMER_SECRET = "secret"
  # Twitter.AUTH_TOKEN = "secret"
  # Twitter.AUTH_SECRET = "secret"

  # Github.CLIENT_ID = "secret"
  # Github.CLIENT_SECRET = "secret"

  # BCrypt::Engine.cost = 12

  # Keybase.DOMAIN = Rails.application.domain
  # Keybase.BASE_URL = ENV.fetch('KEYBASE_BASE_URL') { 'https://keybase.io' }

  ActionMailer::Base.delivery_method = :sendmail

  class << Rails.application
    def allow_invitation_requests?
      ENV["LOBSTER_ALLOW_INVITATION"]
    end

    def allow_new_users_to_invite?
      ENV["LOBSTER_ALLOW_NEW_USERS_INVITE"]
    end

    def domain
      ENV["LOBSTER_HOSTNAME"]
    end

    def name
      ENV["LOBSTER_SITE_NAME"]
    end

    def ssl?
      true
    end
  end
end
