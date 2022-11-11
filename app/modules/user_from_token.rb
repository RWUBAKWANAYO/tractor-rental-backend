module UserFromToken
  def get_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
    Rails.application.credentials.devise[:jwt_secret_key]).first
    return User.find(jwt_payload['sub'])
        
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    e.message
  end

end