# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
antofagasta = Branch.find_or_create_by(name: 'Antofagasta')
concepcion = Branch.find_or_create_by(name: 'Concepción')
santiago = Branch.find_or_create_by(name: 'Santiago')

Account.find_or_create_by(
  name: "Ceso SpA",
  rut: "77.980.500-K",
  number: "7047827-7",
  bank: "Banco Santander",
  email: "santiago@ceso.cl",
  branch: santiago
)
Account.find_or_create_by(
  name: "Ceso SpA",
  rut: "77.980.500-K",
  number: "203478301",
  bank: "Banco Security",
  email: "antofagasta@ceso.cl",
  branch: antofagasta
)
Account.find_or_create_by(
  name: "Ceso SpA",
  rut: "77.980.500-K",
  number: "03-02294-3",
  bank: "Banco BICE",
  email: "ceso@ceso.cl",
  branch: concepcion
)

admin = Role.find_or_create_by(name: 'Administrador')
business = Role.find_or_create_by(name: 'Empresa')
guest = Role.find_or_create_by(name: 'Invitado')

User.create!(
  email: 'oferusat@gmail.com',
  password: 'oferusdev',
  role: admin
) if User.find_by_email('oferusat@gmail.com').nil?

User.create!(
  email: 'empresa@test.com',
  password: 'oferusdev',
  role: business
) if User.find_by_email('empresa@test.com').nil?


battery1 = Battery.find_or_create_by(
  name: 'Batería CESO',
  certification: 'Certificación suprema CESO',
  order: 1
)
battery2 = Battery.find_or_create_by(
  name: 'Batería Garage',
  certification: 'Certificación suprema Garage Labs',
  order: 2
)

exam1 = Exam.find_or_create_by(name: 'Antropometría', price: 10000)
exam2 = Exam.find_or_create_by(name: 'Optometría cerca', price: 5000)

ExamSelection.find_or_create_by(battery: Battery.first, exam: Exam.first, order: 1)
ExamSelection.find_or_create_by(battery: Battery.first, exam: Exam.last, order: 2)
ExamSelection.find_or_create_by(battery: Battery.last, exam: Exam.first, order: 1)

Patient.find_or_create_by(name: 'Seba', rut: '123', phone: '321')
Patient.find_or_create_by(name: 'Magda', rut: '789', phone: '987')