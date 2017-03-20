#!/usr/bin/env ruby

require 'benchmark'
require 'net/http'
require 'optparse'
require 'ostruct'
require 'pry'

Host = 'https://gitlab.com'

class Optparse

    def self.parse(args) 

        # Parse Options
        options = OpenStruct.new
        options.encoding = "utf8"
        options.url = 'https://gitlab.com'
        options.dur = 5 * 60

        opts = OptionParser.new do |opts|
            # Set Defaults here
            opts.banner = "Usage: getHttpTime.rb [options]"
            opts.separator ""
            opts.separator "Specific options:"

            opts.on("-u", "--url URL", 
                "Specify Host URL       default: #{options.url}") do |url|
                options.url = url
            end
            
            opts.on("-d", "--duration",
                "Specify test duration  default: #{options.dur}s") do |dur|
                options.dur = dur
            end

            opts.on_tail("-h", "--help", "Prints this help") do
                STDOUT.puts opts
                exit
            end
        end

    opts.parse!(args)
    options
  end

end

def httpGet(uri)

    http = Net::HTTP.new(uri.host, uri.port)
    if uri.scheme = 'https'
        #http.use_ssl = true
        #http.ssl_version = :SSLv3
    end

    #Net::HTTP.start(uri.host, uri.port).start do |http|

        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)

    #end

    return response 

end


def runTest(options, uri)

    # Run Benchmark over GET request
    time = Benchmark.measure do

        $response = httpGet(uri)

    end    

    return $response

end


def uriTest(url)

    uri = URI.parse(url)
    # debug
    puts uri.scheme

    # Test proper scheme
    if uri.scheme.nil? 
        uri = URI.parse("https://#{url}")
    end

    return uri

end

options = Optparse.parse(ARGV)
STDOUT.puts options

uri = uriTest(options.url)

# debug
puts uri.scheme

response = runTest(options, uri)

case response
when Net::HTTPSuccess
  puts response.message
when Net::HTTPMovedPermanently
  puts response.message
when Net::HTTPRedirect
  #follow_redirect(response)
else
  binding.pry
  raise StandardError, "ERROR: #{response.message}"
end
