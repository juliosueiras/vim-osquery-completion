require 'nokogiri'
require 'open-uri'
require 'json'

page = Nokogiri::HTML(open('https://osquery.io/docs/tables/'))
test = []

['specs', 'windows', 'posix', 'linux', 'darwin','utility' ].each do |type|
  page.css("##{type} > div").each do  |i|
    t = {'word': i.css('.tables-title').text(), 'type': type, 'info': i.css('.description').text(), 'kind': type}
    t['columns'] = []
    i.css('tbody tr').each do |x|
      if x.css('.code-highlight').empty?
        o = x.css('td')
        t['columns'].push({'word': o[0].text(), 'kind': o[1].text().split('_')[0].downcase, 'info': o[2].text().split.join(' ') })
      end
    end
    test.push(t)
  end
end

puts JSON.generate(test)
