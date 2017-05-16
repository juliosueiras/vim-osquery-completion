require 'nokogiri'
require 'open-uri'
require 'json'

page = Nokogiri::HTML(open('https://osquery.io/docs/tables/'))
test = []
page.css('#specs > div').each do  |i| 
  t = {'word': i.css('.tables-title').text(), 'info': i.css('.description').text(), 'kind':'table'}
  t['columns'] = []
  i.css('tbody tr').each do |x|
    if x.css('.code-highlight').empty?
      o = x.css('td')
      t['columns'].push({'word': o[0].text(), 'kind': o[1].text().split('_')[0].downcase, 'info': o[2].text().split.join(' ') })
    end
  end
  test.push(t)
end

page.css('#windows > div').each do  |i| 
  t = {'word': i.css('.tables-title').text(), 'info': i.css('.description').text(), 'kind':'table'}
  t['columns'] = []
  i.css('tbody tr').each do |x|
    if x.css('.code-highlight').empty?
      o = x.css('td')
      t['columns'].push({'word': o[0].text(), 'kind': o[1].text().split('_')[0].downcase, 'info': o[2].text().split.join(' ') })
    end
  end
  test.push(t)
end

page.css('#posix > div').each do  |i| 
  t = {'word': i.css('.tables-title').text(), 'info': i.css('.description').text(), 'kind':'table'}
  t['columns'] = []
  i.css('tbody tr').each do |x|
    if x.css('.code-highlight').empty?
      o = x.css('td')
      t['columns'].push({'word': o[0].text(), 'kind': o[1].text().split('_')[0].downcase, 'info': o[2].text().split.join(' ') })
    end
  end
  test.push(t)
end

page.css('#linux > div').each do  |i| 
  t = {'word': i.css('.tables-title').text(), 'info': i.css('.description').text(), 'kind':'table'}
  t['columns'] = []
  i.css('tbody tr').each do |x|
    if x.css('.code-highlight').empty?
      o = x.css('td')
      t['columns'].push({'word': o[0].text(), 'kind': o[1].text().split('_')[0].downcase, 'info': o[2].text().split.join(' ') })
    end
  end
  test.push(t)
end

page.css('#darwin > div').each do  |i| 
  t = {'word': i.css('.tables-title').text(), 'info': i.css('.description').text(), 'kind':'table'}
  t['columns'] = []
  i.css('tbody tr').each do |x|
    if x.css('.code-highlight').empty?
      o = x.css('td')
      t['columns'].push({'word': o[0].text(), 'kind': o[1].text().split('_')[0].downcase, 'info': o[2].text().split.join(' ') })
    end
  end
  test.push(t)
end

page.css('#utility > div').each do  |i| 
  t = {'word': i.css('.tables-title').text(), 'info': i.css('.description').text(), 'kind':'table'}
  t['columns'] = []
  i.css('tbody tr').each do |x|
    if x.css('.code-highlight').empty?
      o = x.css('td')
      t['columns'].push({'word': o[0].text(), 'kind': o[1].text().split('_')[0].downcase, 'info': o[2].text().split.join(' ') })
    end
  end
  test.push(t)
end
puts JSON.generate(test)
