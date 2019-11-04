class Movie {
	String title;
	String language;
	String genre;
	String trailerUrl;
	String trailerTime;
	String posterImageUrl;
	String detailPosterImageUrl;
	String overview;
	
	Movie(this.title, this.language, this.genre, this.trailerUrl, this.trailerTime, this.posterImageUrl, this.detailPosterImageUrl, this.overview);
}

List<Movie> moviesList = []
	..add(Movie(
		"Joker",
		"English",
		"Crime,Thriller & Drama",
		"https://youtu.be/t433PEQGErc",
		"2:24",
		"assets/images/joker_poster.jpg",
		"assets/images/joker_detail_poster.jpg",
		"During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.\nIn Gotham City, mentally-troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: \"The Joker\".",
	))
	..add(Movie(
		"Jumanji: The Next Level",
		"English",
		"Action,Adventure,Comedy & Fantasy",
		"https://youtu.be/rBxcF-r9Ibs",
		"2:57",
		"assets/images/jumanji_poster.jpg",
		"assets/images/jumanji_detail_poster.jpg",
		"A team of friends return to Jumanji to rescue one of their own but discover that nothing is as they expect. The players need to brave parts unknown, from arid deserts to snowy mountains, in order to escape the world's most dangerous game.",
	))
	..add(Movie(
		"Terminator: Dark Fate",
		"English",
		"Action & Science Fiction",
		"https://youtu.be/8CjYw1hARhY",
		"2:38",
		"assets/images/terminator_poster.jpg",
		"assets/images/terminator_detail_poster.jpg",
		"More than two decades have passed since Sarah Connor prevented Judgment Day, changed the future, and re-wrote the fate of the human race. Dani Ramos is living a simple life in Mexico City with her brother and father when a highly advanced and deadly new Terminator – a Rev-9 – travels back through time to hunt and kill her. Dani's survival depends on her joining forces with two warriors: Grace, an enhanced super-soldier from the future, and a battle-hardened Sarah Connor. As the Rev-9 ruthlessly destroys everything and everyone in its path on the hunt for Dani, the three are led to a T-800 from Sarah’s past that may be their last best hope.",
	))
	..add(Movie(
		"The Dark Knight Rises",
		"English",
		"Action,Crime,Thriller & Drama",
		"https://youtu.be/7gFwvozMHR4",
		"2:12",
		"assets/images/dark_knight_poster.jpg",
		"assets/images/dark_knight_detail_poster.jpg",
		"Following the death of District Attorney Harvey Dent, Batman assumes responsibility for Dent's crimes to protect the late attorney's reputation and is subsequently hunted by the Gotham City Police Department. Eight years later, Batman encounters the mysterious Selina Kyle and the villainous Bane, a new terrorist leader who overwhelms Gotham's finest. The Dark Knight resurfaces to protect a city that has branded him an enemy.",
	))
	..add(Movie(
		"Gemini Man",
		"English",
		"Action, Thriller",
		"https://youtu.be/AbyJignbSj0",
		"2:02",
		"assets/images/gemini_man_poster.jpg",
		"assets/images/gemini_man_detail_poster.jpg",
		"Henry Brogen, an aging assassin tries to get out of the business but finds himself in the ultimate battle: fighting his own clone who is 25 years younger than him and at the peak of his abilities.",
	));