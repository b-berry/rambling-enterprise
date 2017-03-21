#!/usr/bin/env ruby

require 'benchmark'
require 'net/http'
require 'optparse'
require 'ostruct'
require 'pry'

Host = 'https://google.com'

class Optparse

    def self.parse(args) 

        # Parse Options
        options = OpenStruct.new
        options.encoding = "utf8"
        options.dur = 5 * 60
        options.int = 5
        options.url = 'https://google.com'

        opts = OptionParser.new do |opts|
            # Set Defaults here
            opts.banner = "Usage: getHttpTime.rb [options]"
            opts.separator ""
            opts.separator "Specific options:"

            opts.on("-d", "--duration FLOAT", Float,
                "Specify test duration          default: #{options.dur}s") do |dur|
                options.dur = dur.to_f
            end

            opts.on("-i", "--interval FLOAT", Float,
                "Specify interval duration      default: #{options.int}s") do |int|
                options.int = int.to_f
            end
            
            opts.on("-u", "--url URL", 
                "Specify Host URL               default: #{options.url}") do |url|
                options.url = url
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


def calcResults(report)

    time = 0
    report.each do |i|
        time += i.last.to_f
    end

    return time

end

def httpGet(uri)

    http = Net::HTTP.new(uri.host, uri.port)
    if uri.scheme == 'https'
        http.use_ssl = true
        http.ssl_version = :SSLv3
    end

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    return response 

end


def resultTest(response)

    case response[0]
    when Net::HTTPSuccess
        status = response[0].message
    when Net::HTTPMovedPermanently
        status = response[0].message
    when Net::HTTPRedirect
        status = response[0].message
        #follow_redirect(response)
    else
        status = "ERROR: #{response.message}"
        #raise StandardError, "ERROR: #{response.message}"
    end

    return status

end


def runTest(options, uri)

    # Run Benchmark over GET request
    time = Benchmark.measure do
        $response = httpGet(uri)
    end    

    return $response, time

end


def uriTest(url)

    uri = URI.parse(url)

    # Test proper scheme
    if uri.scheme.nil? 
        uri = URI.parse("https://#{url}")
    end

    return uri

end

options = Optparse.parse(ARGV)
STDOUT.puts options

uri = uriTest(options.url)

# Print activity
puts "Running HTTP::Get response test for: #{options.dur}sec Every:#{options.int}sec"
header = [  sprintf("%3s", "#"),
            sprintf("%25s", "Time"),
            sprintf("%3s", "###"),
            sprintf("%17s", "Response message"),
            sprintf("%15s", "Request Time(s)")
         ]
puts header.join(' - ')

report = []
index = 0
start_time = Time.now
while options.dur > Time.now - start_time

    # Run Test over uri
    response = runTest(options, uri)
    
    # status = resultsTest(response)

    report_i  = [   
                    sprintf("%3d", index + 1),
                    sprintf("%24s",Time.now), 
                    sprintf('%3d', response[0].code),
                    sprintf("%17s", response[0].message),
                    sprintf("%13.11f",response[1].real) 
                ]

    puts report_i.join(' - ')

    report << report_i

    # Wait for interval conifg
    sleep(options.int)

    index += 1

end

# Calculate total time
time = calcResults(report)

header = [ sprintf("%41s",""), sprintf("%13s", "Total time(s)"), sprintf("%13s", "Average Time(s)")]
results = [ sprintf("%41s",""), sprintf("%13.11f", time.to_f), sprintf("%13.11f", time.to_f / report.length)]
puts header.join(' - ')
puts results.join(' - ')
