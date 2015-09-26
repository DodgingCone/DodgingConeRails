SimpleTokenAuthentication.configure do |config|
  config.sign_in_token = false

  config.header_names = { 
    player: { authentication_token: 'X-Player-Token', email: 'X-Player-Email' } 
  }

  config.identifiers = { player: 'email' }
end
