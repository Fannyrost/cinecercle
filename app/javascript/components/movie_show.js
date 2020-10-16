const movieShow = () => {
  sleep(10)
  const movies = document.querySelectorAll('.movie-card');
  if (movies === undefined)
    return
      movies.forEach((movie) => {
        movie.addEventListener('click', (event) => {
          event.preventDefault();
          // window.location.href = `/circle/${document.cookie.split("=")[1]}?imdb=${result.imdbID}`;
          console.log(document.cookie.split("=")[1]);
          console.log(movie.dataset.imdb);
      })})};

export { movieShow }
