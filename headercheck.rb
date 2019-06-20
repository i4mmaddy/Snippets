
require'json'
require 'httparty'
require 'colorize'




URL = ARGV.first
para2 = ARGV[1]
puts para2



 
     #robot
  def robot(link) 
      mainurl = link+ "/robots.txt"
      resp =HTTParty.get(mainurl)
     if resp.code == 200
       puts "robots.txt is avaialable ".green    
     else 
       puts "robots.txt is Not avaialable ".red
     end
  end 


     #server
  def server(resp1)
    
    server = JSON.parse(resp1.headers.to_json)['server'] 
    if server.class != NilClass
     puts "Server using is "+ server[0].to_s .green
    else
     puts "Server details not Visible" .red
    end

  end



    #xframe
  def xframe(resp1)
     xframe = JSON.parse(resp1.headers.to_json)['x-frame-options'] 
    if xframe.class == NilClass
     puts "Xframe-options is Not availabale" .green
    else 
     puts "Xframe options is set as " .red + xframe.to_s
    end
  end

 

    #cache
  def cache(resp1) 
    cache = JSON.parse(resp1.headers.to_json)['cache-control']
   if cache.class == NilClass
     puts "cache header is not available"
   else 
     puts "cache header value is " + cache[0].to_s .green
   end
  end 


  def sechead(resp1)
     sechead = JSON.parse(resp1.headers.to_json)['x-xss-protection']
     puts sechead[0].to_s 
     
  end

 
 if c == c
   resp2 =HTTParty.get(URL)
   head = resp2.headers
   #puts JSON.pretty_generate(head)

 else
  resp1 =HTTParty.get(URL)
  robot(URL)
  xframe(resp1)
  server(resp1)
  cache(resp1)
  sechead(resp1)
 end


