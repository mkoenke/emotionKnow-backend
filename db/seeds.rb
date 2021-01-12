# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Parent.destroy_all
puts "destoying parents"
Child.destroy_all
puts "destroying children"
JournalEntry.destroy_all
puts "destroying journal entries"
Report.destroy_all
puts "destroying reports"

parent = Parent.create!(email: "mkoenke@sas.upenn.edu")
# report can not be seeded bc its not created
puts "Parent seeded"

child = Child.create!(username: "Angelina", password: "1234", parent_id: parent.id)
puts "Child seeded"

journal_entry = JournalEntry.create!(title: "Day 1", file: "journal.mp4", child_id: child.id)
puts "Journal seeded"

report = Report.create!(title: "Day 1", file: "report.pdf", journal_entry_id: journal_entry.id)
puts "Report seeded"