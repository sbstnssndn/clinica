# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
battery1 = Battery.create(
  name: 'Batería CESO',
  certification: 'Certificación suprema CESO',
  order: 1
)
battery2 = Battery.create(
  name: 'Batería Garage',
  certification: 'Certificación suprema Garage Labs',
  order: 2
)

exam1 = Exam.create(name: 'Antropometría', price: 10000)
exam2 = Exam.create(name: 'Optometría cerca', price: 5000)

ExamSelection.create(battery: Battery.first, exam: Exam.first, order: 1)
ExamSelection.create(battery: Battery.first, exam: Exam.last, order: 2)
ExamSelection.create(battery: Battery.last, exam: Exam.first, order: 1)