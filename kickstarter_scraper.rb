require 'pry'
require 'nokogiri'

def create_project_hash
  html = File.read("fixtures/kickstarter.html")
  kickstarter = Nokogiri::HTML(html)
  projects = kickstarter.css("li.project.grid_4")
  title = projects.first.css("h2.bbcard_name strong a").text
  thumbnail = projects.first.css("div.project-thumbnail a img").attribute("src").value
  info = projects.first.css("p.bbcard_blurb").text
  location = projects.first.css("ul.project-meta li a span.location-name").text
  per_funded = projects.first.css("ul.project-stats li.first.funded strong").text
  binding.pry
end


create_project_hash
