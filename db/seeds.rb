# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Uncomment these to wipe out old data in the database
Breach.delete_all
Interest.delete_all
Organization.delete_all
Category.delete_all
Article.delete_all


# haveibeenpwned.com data

# file_name = File.expand_path(File.join(File.dirname(__FILE__), 'breach_data.json'))
# breach_data = JSON.parse(File.read(file_name))
#
# (1..7).each do |i| # generate 7 generic numbered categories
#    Category.create(title: "Category#{i}")
# end
#
# last_category = 0
#
# breach_data.each do |breach|
#
#   last_category += 1 # iterate through each category
#   if last_category > 7 then last_category = 1 end
#
#   cat = Category.find_by(title: "Category#{last_category}")
#
#   cat.organizations.create(
#     domain: breach["Domain"],
#     name: breach["Name"],
#   )
#
#   Organization.last.breaches.create(
#     # name: breach["Name"], # omitted
#     title: breach["Title"],
#     # domain: breach["Domain"], # in organization
#     breach_date: breach["BreachDate"],
#     # added_date: breach["AddedDate"], # omitted
#     # pwn_count: breach["PwnCount"], # omitted
#     description: breach["Description"],
#     # is_sensitive: breach["IsSensitive"] # omitted
#   )
#
# end

file_name = File.expand_path(File.join(File.dirname(__FILE__), 'articles.json'))
articles = JSON.parse(File.read(file_name))

articles.each do |i|
  Article.create(title: i["Title"], body: i["Body"])
end


file_name = File.expand_path(File.join(File.dirname(__FILE__), 'companies_categories_Jan28.json'))
companies = JSON.parse(File.read(file_name))

companies.each do |company|

  cat = Category.find_by(title: company["Category"])

  if !cat
    cat = Category.create(title: company["Category"])
  end

  cat.organizations.create(
    domain: company["Company"].downcase + '.com',
    name: company["Company"]
    )

end
