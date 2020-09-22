# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Membership.delete_all
Recommendation.delete_all
Movie.delete_all
Circle.delete_all

# USERS

fanny = User.create!(
  pseudo: "Fafa",
  email: "faf@gmail.com",
  password: "azerty")


yohann = User.create!(
  pseudo: "Yo'",
  email: "yoy@gmail.com",
  password: "azerty")


joel = User.create!(
  pseudo: "Jojo",
  email: "joj@gmail.com",
  password: "azerty")


thomas = User.create!(
  pseudo: "Toto",
  email: "tot@gmail.com",
  password: "azerty")


# CIRCLES

horreurs = Circle.create!(
  title: "Films d'horreur",
  description: "C'est effrayant !",
  user_id: joel.id)


les_copains = Circle.create!(
  title: "Les copains",
  description: "Pour les potes only",
  user_id: fanny.id)


larmoyants = Circle.create!(
  title: "Larmoyant",
  description: "Pour pleurer un bon coup",
  user_id: fanny.id)

auteurs = Circle.create!(
  title: "Films franchouillard",
  description: "Inconnus par la masse",
  user_id: yohann.id)

# MEMBERSHIPS

m1 = Membership.create!(user_id: fanny.id, circle_id: horreurs.id)
m2 = Membership.create!(user_id: thomas.id, circle_id: horreurs.id)

m3 = Membership.create!(user_id: yohann.id, circle_id: les_copains.id)
m4 = Membership.create!(user_id: joel.id, circle_id: les_copains.id)
m5 = Membership.create!(user_id: thomas.id, circle_id: les_copains.id)

m6 = Membership.create!(user_id: joel.id, circle_id: auteurs.id)

m7 = Membership.create!(user_id: yohann.id, circle_id: larmoyants.id)
m8 = Membership.create!(user_id: joel.id, circle_id: larmoyants.id)


# MOVIES

silence_agneaux = Movie.from_imdbid("tt0102926")
saw = Movie.from_imdbid("tt0387564")
get_out = Movie.from_imdbid("tt5052448")
silent_hill = Movie.from_imdbid("tt0384537")

five = Movie.from_imdbid("tt4741714")
oss = Movie.from_imdbid("tt0464913")
war = Movie.from_imdbid("tt8579674")

seabiscuit = Movie.from_imdbid("tt0329575")
pearl = Movie.from_imdbid("tt0213149")


# RECOMMENDATIONS

r1 = Recommendation.new(membership_id: m1.id, movie_id: get_out.id, rating: 3, review_content: "Quiet OK")
r2 = Recommendation.new(membership_id: m1.id, movie_id: silence_agneaux.id, rating: 5, review_content: "So scary !!")
r3 = Recommendation.new(membership_id: m2.id, movie_id: silent_hill.id, rating: 4, review_content: "You've gotta see it")

r4 = Recommendation.new(membership_id: m3.id, movie_id: five.id, rating: 5, review_content: "Must have seen")
r5 = Recommendation.new(membership_id: m4.id, movie_id: oss.id, rating: 5, review_content: "Obviously")
r6 = Recommendation.new(membership_id: m3.id, movie_id: war.id, rating: 4, review_content: "Don't be sick")

r7 = Recommendation.new(membership_id: m7.id, movie_id: seabiscuit.id, rating: 3, review_content: "I love the poneys")
r8 = Recommendation.new(membership_id: m8.id, movie_id: pearl.id, rating: 3, review_content: "So american")




