require 'rubygems' 
require 'nokogiri' #gem to parse html
require "open-uri" 

puts "URL: "
remote_full_url = gets.chomp #link to be parsed
remote_data = Nokogiri::HTML(open(remote_full_url))   
local_file_name = gets.chomp # I want to automate this step, it will be something like the next line, I think:
#local_file_name = (remote_data.css("td#ctl00_ctl13_g_8035397e_bdf3_4dc3_b9fb_8732bb699c12_ctl00_ucNome_rptContent_ctl01_lblText").text)
my_local_filename = local_file_name + ".txt" # 
my_local_file = open(my_local_filename, "w") # creates the .txt file where the text will be copied
my_local_file.write(remote_full_url) #copies the URL to the file
my_local_file.write("
	
	") #paragraph
my_local_file.write(remote_data.css("title").text) #copies the html <title> tag to the file
my_local_file.write("
	
	")
my_local_file.write(remote_data.css("div#ctl00_ctl13_g_8035397e_bdf3_4dc3_b9fb_8732bb699c12_ctl00_pnlDep").text) #copies all the text in the <p> tag, including the text in <a> tags
my_local_file.close #closes the file 
puts "Done"

#ctl00_ctl13_g_8035397e_bdf3_4dc3_b9fb_8732bb699c12_ctl00_ucNome_rptContent_ctl01_lblText - this is the div where the complete name of the member of the parliament is available
#this is still under construction, I want to automate most of the process and creat a cv file with all the info automatically