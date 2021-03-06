require_relative 'Gist_Attributes'
require_relative 'Gist_Request'
require_relative 'Github_logo'
require 'paint'

github_logo = Logo.new()
github_logo.print

loop do
  print "Ingrese el nombre de su archivo: "
  filename = gets.chomp
  puts Paint["====================================================================================================", :cyan]
  print "Ingrese una descripción: "
  description = gets.chomp
  puts Paint["====================================================================================================", :cyan]
  print "Quieres que tu repositorio sea público? Si/No, por defecto el repositorio será público: "
  state = gets.chomp.capitalize
  puts Paint["====================================================================================================", :cyan]
  state = state != "No"
  gist = GistAttributes.new(filename, description, state)
  
  if gist.check_existence()
    break if gist.gist_attr.response_status == HTTP_STATUS_CREATED
    break if gist.gist_attr.try_again == "No"
  else
    break
  end
end
