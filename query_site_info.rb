require 'nokogiri'
require 'httparty'
require 'csv'

def parse_website(url, csv_filename)
  response = HTTParty.get(url)

  if response.success?
    doc = Nokogiri::HTML(response.body)

    target_div = doc.css('div#BlinkDBContent_849210 > ul')

    if target_div.any?
      # Знаходимо всі елементи <li> в межах цього <ul>
      li_elements = target_div.first.css('li')

      # Виводимо дані в CSV-файл
      if li_elements.any?
        CSV.open(csv_filename, 'w') do |csv|
          li_elements.each do |li|
            # Записуємо дані з кожного елемента <li> у CSV-файл
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

# Замініть URL та ім'я файлу CSV на ті, які ви хочете використовувати
website_url = 'https://www.hospitalsafetygrade.org/all-hospitals'
csv_filename = 'li_elements_inside_div_data.csv'

parse_website(website_url, csv_filename)
