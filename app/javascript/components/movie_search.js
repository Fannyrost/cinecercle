const movieSearch = () => {

  const form = document.querySelector('#movie-search');

  const apiKey = "ce8d3236";
  const results = document.querySelector('.movies')

  if (form === undefined)
    return;
  form.addEventListener('submit', event => {
    event.preventDefault();
    results.innerHTML = "";
    const input = document.querySelector('input').value;

    fetch(`https://www.omdbapi.com/?s=${input}&apikey=${apiKey}`)
    .then(response => response.json())
    .then((data) => {
      console.log(data);

      data.Search.forEach((result) => {
        let poster = null
        result.Poster === "N/A" ? poster = "../../assets/images/movie-web.jpg" : poster = result.Poster
        const movie = `
<div class="movie-card m-4 d-flex flex-column align-items-center" data-imdb="${result.imdbID}">
  <a href="#"></a>
  <div class=" movie-img" style="background-image: url('${poster}');">
    <a href="#"></a>
    <a href="#">
  </div>
  <div class="movie-card-content">
    <h2>${result.Title} (${result.Year})</h2>
  </div>
</div>`;
        results.insertAdjacentHTML("beforeend", movie);

      });

    const movies = document.querySelectorAll('.movie-card');

        movies.forEach((movie) => {
          movie.addEventListener('click', (event) => {
            event.preventDefault();

            const circle = document.cookie.split("=")[1];
            const imbdId = movie.dataset.imdb;

              window.location.href = `/circles/${circle}/movies/movie?imdbid=${imbdId}`;
            });
        })
      })
    });

  };


export { movieSearch }

    // <div id="addmovie" class="btn-underline-hover my-2 d-flex justify-content-start" style="margin-left: 185px;">
    //   <div><i class="fas fa-plus"></i></div>
    //   <div class="btn-underline-white ml-2"><p>Ajouter au cercle</p></div>
    // </div>
    // </a>
