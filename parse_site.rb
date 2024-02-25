require 'open-uri'
require 'nokogiri'

# Завантаження HTML-сторінки
url = 'https://en.wikipedia.org/wiki/List_of_social_networking_services'
html = URI.open(url)
doc = Nokogiri::HTML(html)

# Пошук таблиці зі списком соціальних мереж
table = doc.at('table.wikitable')

# Якщо таблиця знайдена, розпочинаємо парсинг
if table
  # Проходимося по кожному рядку таблиці
  table.search('tr').each do |row|
    # Отримуємо дані з колонок
    columns = row.search('th, td').map(&:text)

    # Виводимо дані, якщо вони присутні
    unless columns.empty?
      puts "Назва: #{columns[0]}"
      puts "Опис: #{columns[1]}"
      puts "URL: #{columns[2]}"
      puts "--------------------------------------------------"
    end
  end
else
  puts "Таблиця не знайдена на сторінці."
end
