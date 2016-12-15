module ApplicationHelper

  def get_reviews(user_input)
    require 'mechanize'
    # mechanize = Mechanize.new
    #
    # page = mechanize.get('https://www.yelp.com/nyc')
    #
    # puts page.at('#loc-bar').text.strip
    #
    # puts "hello there"

    mechanize = Mechanize.new

    page = mechanize.get('http://weblog.rubyonrails.org/')

    return page.at('.entry-title').text.strip
  end
end
