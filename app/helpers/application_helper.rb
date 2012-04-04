module ApplicationHelper
  
  def machine_qr_code(slug)
    url = "https://cafezinho.herokuapp.com/at/#{slug}"
    image_tag "https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=#{CGI.escape url}"
  end
  
end
