require 'nokogiri'
require 'httparty'
require 'csv'

def parse_website(url, csv_filename)
  response = HTTParty.get(url)

  if response.success?
    doc = Nokogiri::HTML(response.body)

    target_div = doc.css('div#BlinkDBContent_849210 > ul')

    if target_div.any?
      li_elements = target_div.first.css('li')

      if li_elements.any?
        CSV.open(csv_filename, 'w') do |csv|
          li_elements.each do |li|
            csv << [li.text.strip]
          end
        end

        puts "Data from <li> elements inside the specified <div> have been successfully written to #{csv_filename}."
      else
        puts 'No <li> elements found inside the specified <div>.'
      end
    else
      puts 'Target <div> with id "BlinkDBContent_849210" and <ul> not found on the page.'
    end
  else
    puts "Failed to retrieve the page. Status code: #{response.code}"
  end
end

website_url = 'https://www.hospitalsafetygrade.org/all-hospitals'
csv_filename = 'come_on_bruh.csv'

parse_website(website_url, csv_filename)
