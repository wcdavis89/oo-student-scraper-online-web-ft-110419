require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
     def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses
    self.get_page.css(".post")
  end
  
  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

