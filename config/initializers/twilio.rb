path = File.join(Rails.root, "config/twilio.yml")
TWILIO_CONFIG = YAML.load(File.read(path))[Rails.env] || {'sid' => '', 'from' => '', 'token' => ''}
#
# Twilio.from = ENV["from"]
# Twilio.sid = ENV["sid"]
# Twilio.token = ENV["token"]
