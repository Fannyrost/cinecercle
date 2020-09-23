# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# USERS

fanny = User.find_by(email: "faf@gmail.com")


yohann = User.find_by(email: "yoy@gmail.com")

joel = User.find_by(email: "joj@gmail.com")


thomas = User.find_by(email: "tot@gmail.com")


# CIRCLES

horreurs = Circle.find_by(
  title: "Films d'horreur",
  description: "C'est effrayant !",
  user_id: joel.id)


les_copains = Circle.find_by(
  title: "Les copains",
  description: "Pour les potes only",
  user_id: fanny.id)


larmoyants = Circle.find_by(
  title: "Larmoyant",
  description: "Pour pleurer un bon coup",
  user_id: fanny.id)

auteurs = Circle.find_by(
  title: "Films franchouillard",
  description: "Inconnus par la masse",
  user_id: yohann.id)

# MEMBERSHIPS

m1 = Membership.find_by(user_id: fanny.id, circle_id: horreurs.id)
m2 = Membership.find_by(user_id: thomas.id, circle_id: horreurs.id)

m3 = Membership.find_by(user_id: yohann.id, circle_id: les_copains.id)
m4 = Membership.find_by(user_id: joel.id, circle_id: les_copains.id)
m5 = Membership.find_by(user_id: thomas.id, circle_id: les_copains.id)

m6 = Membership.find_by(user_id: joel.id, circle_id: auteurs.id)

m7 = Membership.find_by(user_id: yohann.id, circle_id: larmoyants.id)
m8 = Membership.find_by(user_id: joel.id, circle_id: larmoyants.id)


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

r1 = Recommendation.create!(membership_id: m1.id, movie_id: get_out.id, rating: 3, review_content: "Quiet OK")
r2 = Recommendation.create!(membership_id: m1.id, movie_id: silence_agneaux.id, rating: 5, review_content: "So scary !!")
r3 = Recommendation.create!(membership_id: m2.id, movie_id: silent_hill.id, rating: 4, review_content: "You've gotta see it")

r4 = Recommendation.create!(membership_id: m3.id, movie_id: five.id, rating: 5, review_content: "Must have seen")
r5 = Recommendation.create!(membership_id: m4.id, movie_id: oss.id, rating: 5, review_content: "Obviously")
r6 = Recommendation.create!(membership_id: m3.id, movie_id: war.id, rating: 4, review_content: "Don't be sick")

r7 = Recommendation.create!(membership_id: m7.id, movie_id: seabiscuit.id, rating: 3, review_content: "I love the poneys")
r8 = Recommendation.create!(membership_id: m8.id, movie_id: pearl.id, rating: 3, review_content: "So american")




