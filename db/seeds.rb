# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Contact.delete_all

u1 = User.create(email: 'rubena@gmail.com', password: '123456')
u2 = User.create(email: 'rubenb@gmail.com', password: '123456')


c1 = Contact.create(
  name: "Oscar", 
  date_of_birth: "07/03/1989", 
  phone: "4895697", 
  address: "Home", 
  credit_card:"123459684756894576", 
  franchise: "Visa", 
  email:"email@gmail.com", 
  user_id: u1.id
)

c2 = Contact.create(
  name: "Oscar", 
  date_of_birth: "07/03/1989", 
  phone: "4895697", 
  address: "Home", 
  credit_card:"123459684756894576", 
  franchise: "Visa", 
  email:"email@gmail.com", 
  user_id: u1.id
)


up1 = Upload.create(status: 1, total_items: 500, user_id: u1.id)
up2 = Upload.create(status: 2, total_items: 300, user_id: u1.id)
up3 = Upload.create(status: 3, total_items: 200, user_id: u1.id)

d1 = UploadDetail.create(row: 12, column: 2, data: "rubengmail.com", error: "email needs @", upload_id: up1.id)
d1 = UploadDetail.create(row: 32, column: 2, data: "rubengmail.com", error: "email needs @", upload_id: up2.id)
d1 = UploadDetail.create(row: 11, column: 2, data: "rubengmail.com", error: "email needs @", upload_id: up3.id)
