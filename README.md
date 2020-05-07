plist2ota
=========

Generate OTA Manifest for your iOS applications from its plist file

Requirements
============

- plist gem: To install type "gem install plist" 
- perl: you're probably using a Mac so you should have this
- ruby: for the same reasons above, you should have this

Usage
=====

Quick and Dirty:
----------------

### 1 Is your plist a binary file?

__YES:__

Use the script provided and convert your plist to a XML plist.
If you plist is named "Input.plist", the command will look like this:

    $ perl plutil.pl Input.plist

The output file will be called "Input.text.plist"

__NO:__

Good! Go, go to step 2.

### 2 Generate the OTA Manifest

If your plist is named "Input.text.plist", the command will look like this:

    $ ruby plist2ota.rb Input.text.plist

The manifest will be output to STDOUT (aka, the console).

Problems, troubles, requests? Use Github's Issues page!

*Plist gem can found at: http://rubygems.org/gems/plist
