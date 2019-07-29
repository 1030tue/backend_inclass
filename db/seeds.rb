# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Student.create(firstname:"Jean", lastname:"Grey", email:"carmex.t@tea.com", img: nil, age: 18, grade: 9, gender: "female", guardians_email: "hershey@tea.com", guardians_phone: "1230907890")


Student.create(firstname:"Steve", lastname:"Rogers", email:"steve.r@tea.com", img: nil, age: 17, grade: 8, gender: "male",  guardians_name: "Sarah Roger", relationship_to_student: "mom", guardians_email: "sarahrogers@tea.com", guardians_phone: "9144395809", inclass: true, demerits: 0)


Student.create(firstname:"Logan", lastname:"Howlett", email:"logan.h@tea.com", img: nil, age: 17, grade: 9, gender: "male", guardians_name: "wolverine", relationship_to_student: "dad", guardians_email: "wolverine@tea.com", guardians_phone: "9144395809", inclass: true, demerits: 0)

Student.create(firstname:"Peter", lastname:"Parker", email:"steve.r@tea.com", img: nil, age: 17, grade: 8, gender: "male", guardians_name: "Mary", relationship_to_student: "Aunt", guardians_email: "sarahrogers@tea.com", guardians_phone: "9144395809", inclass: true, demerits: 0)


Student.create(firstname:"Arya", lastname:"Stark", email:"aray@tea.com", img: nil, age: 15, grade: 8, gender: "female", guardians_name: "Sansa", relationship_to_student: "Sister", guardians_email: "sansa@tea.com", guardians_phone: "9144395809", inclass: true, demerits: 0)


Student.create(firstname:"Bran", lastname:"Stark", email:"bran@tea.com", img: nil, age: 17, grade: 10, gender: "female", guardians_name: "Sansa", relationship_to_student: "Sister", guardians_email: "sansa@tea.com", guardians_phone: "9144395809", inclass: true, demerits: 0)
