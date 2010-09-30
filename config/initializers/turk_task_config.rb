TURKTASK_AWSACCESSKEYID = 'XXXXX'
TURKTASK_AWSACCESSKEY   = 'YYYYY'
TURKTASK_FORM_DOMAIN    = RAILS_ENV == 'development' ? "http://aantix.dyndns.org:3000" : "https://turkee.textmatch.me"

TURKTASK_SANDBOX        = Rails.env == 'production' ? false : true

RTurk::logger.level = Logger::DEBUG
RTurk.setup(TURKTASK_AWSACCESSKEYID, TURKTASK_AWSACCESSKEY, :sandbox => TURKTASK_SANDBOX)