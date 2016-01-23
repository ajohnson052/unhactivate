# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

file_name = File.expand_path(File.join(File.dirname(__FILE__), 'breach_data.json'))
breach_data = JSON.parse(File.read(file_name))

(1..7).each do |i| # generate 7 generic numbered categories
   Category.create(title: "Category#{i}")
end

last_category = 0

# cat = Category.create(title: "everything")

breach_data.each do |breach|

  last_category += 1 # iterate through each category
  if last_category > 7 then last_category = 1 end

  cat = Category.find_by(title: "Category#{last_category}")

  cat.organizations.create(
    domain: breach["Domain"],
    name: breach["Name"],
  )

  Organization.last.breaches.create(
    # name: breach["Name"], # omitted
    title: breach["Title"],
    # domain: breach["Domain"], # in organization
    breach_date: breach["BreachDate"],
    # added_date: breach["AddedDate"], # omitted
    # pwn_count: breach["PwnCount"], # omitted
    description: breach["Description"],
    # is_sensitive: breach["IsSensitive"] # omitted
  )

end

# schema
# create_table "breaches", force: :cascade do |t|
#   t.string   "title"
#   t.date     "breach_date"
#   t.text     "description"
#   t.datetime "created_at",  null: false
#   t.datetime "updated_at",  null: false
# end
#
# create_table "categories", force: :cascade do |t|
#   t.string   "title"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "organizations", force: :cascade do |t|
#   t.string   "name"
#   t.string   "domain"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
