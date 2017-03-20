#!/usr/bin/env ruby

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
                options.host = url
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

options = Optparse.parse(ARGV)
STDOUT.puts options
