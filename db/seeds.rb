# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times {
  Song.create!(
    name: "Vesoul",
    lyrics: "T'as voulu voir Vierzon
      Et on a vu Vierzon
      T'as voulu voir Vesoul
      Et on a vu Vesoul
      T'as voulu voir Honfleur
      Et on a vu Honfleur
      T'as voulu voir Hambourg
      Et on a vu Hambourg
      J'ai voulu voir Anvers
      On a revu Hambourg
      J'ai voulu voir ta sœur
      Et on a vu ta mère
      Comme toujours"
    )
}
