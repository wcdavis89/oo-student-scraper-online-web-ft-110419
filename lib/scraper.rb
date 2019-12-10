require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper
  attr_accessor :students


  def self.scrape_index_page(index_url)

    index_html = open(index_url)
    index_doc = Nokogiri::HTML(index_html)
    student_cards = index_doc.css(".student-card")
    students = []
    student_cards.collect do |student_card_xml|
      students << {
        :name => student_card_xml.css("h4.student-name").text,
        :location => student_card_xml.css("p.student-location").text,
        :profile_url => "./fixtures/student-site/" + student_card_xml.css("a").attribute("href").value
        }
    end
    students
  end
end