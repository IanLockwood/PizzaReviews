require 'mechanize'
module Mech
  def self.get_reviews(user_input)
    mechanize = Mechanize.new

    page = mechanize.get('https://www.yelp.com/nyc')

    search_form = page.form_with(:id => "header_find_form")
    search_form.field_with(:id => "find_desc").value = user_input + "pizza"
    search_results = mechanize.submit search_form

    restaurant_link = search_results.root.css('.regular-search-result > .search-result > .biz-listing-large > .main-attributes > .media-block > .media-avatar > .photo-box > a').first

    if restaurant_link
      restaurant_link = Mechanize::Page::Link.new restaurant_link, mechanize, search_results

      biz_page = restaurant_link.click

      sort_new = 'https://www.yelp.com' + restaurant_link.href + '/?sort_by=date_desc'

      sorted_page = mechanize.get(sort_new)

      reviews = sorted_page.root.css('.review-content')

      review_values = []

      reviews[0..9].each do |review|
        title = review.css('.biz-rating > div > .i-stars').attribute('title').value
        content = review.css('p').text.strip
        review_values << [title, content]
      end

      return review_values

    else
      return nil
    end
  end
end
