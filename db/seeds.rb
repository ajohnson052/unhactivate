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

(1..10).each do |i|
  Article.create(title: "Article#{i}", body: "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
  <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>")

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
