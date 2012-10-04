# Author: Francisco Dalla Rosa Soares (francisco_d_r_soares@cyberagent.co.jp)		#

require 'rubygems'
require 'plist'

TEMPLATE_PATH = "./"

class CFBundle
	attr_accessor :name, :short_version, :identifier

	def initialize(filename)
		plist = Plist::parse_xml(filename)
		@name = plist['CFBundleName']
		@short_version = plist['CFBundleShortVersionString']
		@identifier = plist['CFBundleIdentifier']
	end

	def output_manifest
		begin
			manifest = File.open('OTAManifestTemplate.plist')
			manifest.readlines.each do |line|
				if not line.nil?
					line.gsub!('${CFBundleName}',@name)
					line.gsub!('${CFBundleShortVersionString}',@short_version)
					line.gsub!('${CFBundleIdentifier}',@identifier)
					puts line
				end
			end
		end
		rescue SystemCallError
			puts "Could not open the Manifest template file (OTAManifestTemplate.plist).\nMake sure you have it in the same directory you're running plist2ota.rb"
		end

end

test = CFBundle.new(ARGV[0])
test.output_manifest
