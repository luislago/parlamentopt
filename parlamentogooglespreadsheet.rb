#I want to put all the info on a google spreadsheet, but I'm still figuring out how to do it properly. 
#This is a work in progress
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
# this is only printing on row 2. I need to make it read if there's anything on a row and if it is, to print the data to 
#the row below. 
# I also need to figure out how to handle things like "Actividades" 
#(span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvActividades_ctl02_lblActividade), where some of the 
#Members have more than one entry. the <span> is always identical, with a different number before "_lblText"
ws[2,1] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_lblNomeCompleto").text) #Nome Completo	
ws[2,2] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_lblActividadePrincipal").text)#Actividade Principal
ws[2,3] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_lblEstadoCivil").text) #Estado Civil
ws[2,4] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_lblNomeConjuge").text)#Conjuge
ws[2,5] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_lblRegimeBens").text)#Regime de Bens
ws[2,6] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvActividades_ctl02_lblActividade").text)#Actividade
ws[2,7] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvActividades_ctl02_lblDataInicio").text)#Actividade Inicio
ws[2,8] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvActividades_ctl02_lblDataFim").text)#Actividade Fim
ws[2,9] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvActividades_ctl02_lblRemunerada").text)#Remunerada
ws[2,10] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvCargosSociais_ctl02_lblCargo").text)#Cargo
ws[2,11] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvCargosSociais_ctl02_lblEntidade").text)#Entidade
ws[2,12] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvCargosSociais_ctl02_lblDataInicio").text)#Cargo Inicio
ws[2,13] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvCargosSociais_ctl02_lblDataFim").text)#Cargo Fim
ws[2,14] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvCargosSociais_ctl02_lblAreaActividade").text)#Natureza
ws[2,15] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvCargosSociais_ctl02_lblLocalSede").text)#Sede
ws[2,16] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_lblApoiosBeneficios").text)#ApoiosBeneficios
ws[2,17] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_lblServicosPrestados").text)#Servicos Prestados
ws[2,18] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvSociedades_ctl02_lblEntidade").text)#Entidade Sociedades
ws[2,19] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvSociedades_ctl02_lblAreaActividade").text)#Area de Actividade
ws[2,20] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvSociedades_ctl02_lblLocalSede").text)#Local da sede
ws[2,21] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_gvSociedades_ctl02_lblParticipacaoSocial").text)#Participacao Social
ws[2,22] = (remote_data.css("span#ctl00_ctl13_g_e4f66c46_a162_4329_83cb_3d7fe77e4b57_ctl00_lblOutrasSituacoes").text)#Outras situacoes	

#  
ws.save()

puts "Done"
