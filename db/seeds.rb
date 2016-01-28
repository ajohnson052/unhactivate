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

# (1..10).each do |i|
#   Article.create(title: "Article#{i}", body: "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
#   <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>")
#
# end


file_name = File.expand_path(File.join(File.dirname(__FILE__), 'companies_categories_Jan28.json'))
companies = JSON.parse(File.read(file_name))

companies.each do |company|

  cat = Category.find_by(title: company["Category"])

  if !cat
    cat = Category.create(title: company["Category"])
  end

  cat.organizations.create(
    domain: company["Company"].downcase + '.com',
    name: company["Company"].strip
    )

end

# <p>June 15, 2015</p>
#
# <p>The United States Office of Personnel Management (OPM) announced today that it has suffered a massive data breach in which the records of more than 22 million individuals were compromised.</p>
#
# <p><strong>What was compromised: </strong></p>
#
# <p>Information targeted in the breach included personally identifiable information such as Social Security numbers, as well as names, dates and places of birth, and addresses.</p>
#
# <p>The hack went deeper than initially believed and likely involved theft of detailed security-clearance-related background information, possibly even including biometric data.</p>
#
# <p><strong>Actions to take:</strong></p>
#
# <ul>
#  <li>Check your credit report at Credit Karma.</li>
#  <li>Look for accounts or charges you don&rsquo;t recognize. Even if the breach didn&rsquo;t involve credit card information, the thieves may use your Social Security number, address and date of birth to open accounts in your name.</li>
#  <li>OPM announced that it plans to offer credit report access, credit monitoring, and identity theft insurance and recovery services to potentially affected individuals. Take advantage of this offer.</li>
#  <li>Place a fraud alert on your credit reports. With a fraud alert, businesses must verify your identity before providing new credit. An initial fraud alert lasts 90 days but you can renew it.</li>
# </ul>

# create_table "breaches", force: :cascade do |t|
#   t.string   "title"
#   t.date     "breach_date"
#   t.text     "description"
#   t.integer  "organization_id"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end

opm = Organization.find_by(name: "Office of Personnel Management (OPM)")

opm.breaches.create(
  title: "OPM",
  breach_date: "2015-06-15",
  description: "<p><strong>What was compromised: </strong></p>

  <p>Information targeted in the breach included personally identifiable information such as Social Security numbers, as well as names, dates and places of birth, and addresses.</p>

  <p>The hack went deeper than initially believed and likely involved theft of detailed security-clearance-related background information, possibly even including biometric data.</p>

  <p><strong>Actions to take:</strong></p>

  <ul>
   <li>Check your credit report at Credit Karma.</li>
   <li>Look for accounts or charges you don&rsquo;t recognize. Even if the breach didn&rsquo;t involve credit card information, the thieves may use your Social Security number, address and date of birth to open accounts in your name.</li>
   <li>OPM announced that it plans to offer credit report access, credit monitoring, and identity theft insurance and recovery services to potentially affected individuals. Take advantage of this offer.</li>
   <li>Place a fraud alert on your credit reports. With a fraud alert, businesses must verify your identity before providing new credit. An initial fraud alert lasts 90 days but you can renew it.</li>
  </ul>"
)

centene = Organization.find_by(name: "Centene Corp")

centene.breaches.create(
  title: "Centene Corp.",
  breach_date: "2016-01-26",
  description: "<p>Health insurer Centene announced today that six hard drives containing personal information on almost one million customers have been lost.</p>

  <p><strong>What was compromised: </strong></p>

  <p>The lost hard drives included data such as enrollees&#39; names, addresses, birth dates, Social Security numbers, Centene ID numbers and other health information.</p>

  <p><strong>Actions to take:</strong></p>

  <ul>
   <li>Check your credit report at Credit Karma.</li>
   <li>Utilize any free identification monitoring services Centene decides to offer.</li>
   <li>Look for accounts or charges you don&rsquo;t recognize. Even if the breach didn&rsquo;t involve credit card information, the thieves may use your Social Security number, address and date of birth to open accounts in your name.</li>
   <li>Place a fraud alert on your credit reports. With a fraud alert, businesses must verify your identity before providing new credit. An initial fraud alert lasts 90 days but you can renew it.&nbsp;</li>
  </ul>"
)

blue_shield = Organization.find_by(name: "Blue Shield of California")

blue_shield.breaches.create(
  title: "Blue Cross of California",
  breach_date: "2016-01-14",
  description: "<p>January 14, 2016</p>

  <p>Blue Shield of California says the personal information of almost 21,000 people who enrolled in coverage between October 2013 and December 2015 may have been exposed as a result of a data breach at a third-party vendor.</p>

  <p><strong>What was compromised: </strong></p>

  <p>The information potentially exposed includes names, addresses, birthdates and Social Security numbers of customers. This was allegedly the result of log-in credentials for certain Blue Shield customer service representatives being misused.</p>

  <p><strong>Actions to take:</strong></p>

  <ul>
   <li>Check your credit report at Credit Karma.</li>
   <li>Utilize Blue Cross&rsquo;s offer of a free one-year membership in Experian&#39;s ProtectMyID Alert service if you have been affected.</li>
   <li>Look for accounts or charges you don&rsquo;t recognize. Even if the breach didn&rsquo;t involve credit card information, the thieves may use your Social Security number, address and date of birth to open accounts in your name.</li>
   <li>Place a fraud alert on your credit reports. With a fraud alert, businesses must verify your identity before providing new credit. An initial fraud alert lasts 90 days but you can renew it.&nbsp;</li>
  </ul>"
)

time_warner = Organization.find_by(name: "Time Warner")

time_warner.breaches.create(
  title: "Time Warner Cable",
  breach_date: "2016-01-07",
  description: "<p><strong>What was compromised: </strong></p>

  <p>Email and password information of customers were likely obtained through downloaded malware during a phishing attack or indirectly through data breaches of other companies that stored Time Warner Cable customer information.</p>

  <p><strong>Actions to take:</strong></p>

  <ul>
   <li>Check your credit report at Credit Karma.</li>
   <li>Utilize Blue Cross&rsquo;s offer of a free one-year membership in Experian&#39;s ProtectMyID Alert service if you have been affected.</li>
   <li>Look for accounts or charges you don&rsquo;t recognize. Even if the breach didn&rsquo;t involve credit card information, the thieves may use your Social Security number, address and date of birth to open accounts in your name.</li>
   <li>Place a fraud alert on your credit reports. With a fraud alert, businesses must verify your identity before providing new credit. An initial fraud alert lasts 90 days but you can renew it.</li>
  </ul>

  <p>&nbsp;</p>"
)
