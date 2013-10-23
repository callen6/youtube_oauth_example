Rails.application.config.middleware.use OmniAuth::Builder do
  provider :youtube, ENV['YOUTUBE_KEY'], ENV['YOUTUBE_SECRET'], {:access_type => 'online', :approval_prompt => ''}
end

OmniAuth.config.logger = Rails.logger

SERVICES = YAML.load(File.open("#{::Rails.root}/config/oauth.yml").read)

Rails.application.config.middleware.use OmniAuth::Builder do

  # Note: access_type can be 'online' (for just authenticating) or 'offline' (for using services)
  # approval_prompt should be a blank string or else it defaults to 'force', which requires re-authenticating on each login/usage
  provider :google_oauth2, ENV['YOUTUBE_KEY'], ENV['YOUTUBE_SECRET'], {:access_type => 'online', :approval_prompt => ''} # if SERVICES['google']
  provider :youtube, ENV['YOUTUBE_KEY'], ENV['YOUTUBE_SECRET'], {:access_type => 'online', :approval_prompt => ''} # if SERVICES['google']

end
