benji = User.create({ username: 'benji', email: 'benji@gmail.com', password_digest: 'hello'})

enji = User.create({ username: 'enji', email: 'enji@gmail.com', password_digest: 'hello'})

feature1 = Feature.create({ title: 'Her', year: '2013', genre: 'drama', imdb_id: 'tt1798709', poster: 'https://img.omdbapi.com/?apikey=959b296c&i=tt1798709'})

feature2 = Feature.create({ title: 'Frozen', year: '2013', genre: 'fantasy', imdb_id: 'tt2294629', poster: 'https://img.omdbapi.com/?apikey=959b296c&i=tt2294629'})

Recommendation.create([{ feature_id: feature1.id, sender_id: benji.id, recipient_id: enji.id }])

Friend.create([{ user1_id: benji.id, user2_id: enji.id, pending: false }])