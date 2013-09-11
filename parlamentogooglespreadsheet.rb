#I want to put all the info on a google spreadsheet, but I'm still figuring out how to do it properly. This is a work in progress
require 'rubygems' 
require 'nokogiri' #gem to parse html
require "open-uri" 
require "google_drive" #to write on a google spreadsheet

puts "your mail"
mail = gets.chomp
puts "your password"
password = gets.chomp
puts "URL: "
remote_full_url = gets.chomp #link to be parsed

session = GoogleDrive.login(mail,password)
# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=0ApYLZ3W1aumqdFVONnRGMVF5Z1RwRm5CMjZRRHpPX0E - as example
ws = session.spreadsheet_by_key("0ApYLZ3W1aumqdFVONnRGMVF5Z1RwRm5CMjZRRHpPX0E").worksheets[0]
remote_data = Nokogiri::HTML(open(remote_full_url)) 

ws[2, 1] = (remote_data.css("span#ctl00_ctl13_g_8035397e_bdf3_4dc3_b9fb_8732bb699c12_ctl00_ucNome_rptContent_ctl01_lblText").text)
ws.save()