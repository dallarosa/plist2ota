#!/usr/bin/env ruby

#																																								#
# Author: Francisco Dalla Rosa Soares (francisco_d_r_soares@cyberagent.co.jp)		#
#																																								#

require 'rubygems'
require 'plist'

TEMPLATE_PATH = "./"

class CFBundle
	attr_accessor :name, :short_version, :identifier

	def initialize()
		plist = Plist::parse_xml("Input.text.plist")
		@name = plist['CFBundleName']
		@short_version = plist['CFBundleShortVersionString']
		@identifier = plist['CFBundleIdentifier']
	end

	def output_manifest
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

end

test = CFBundle.new
test.output_manifest
