const movieSearch = () => {
  const form = document.querySelector('#movie-search');

  if (form === undefined)
    return


  const apiKey = "ce8d3236";
  const results = document.querySelector('.movies')

  form.addEventListener('keyup', event => {
    results.innerHTML = "";
    const input = document.querySelector('input').value;

    fetch(`http://www.omdbapi.com/?s=${input}&apikey=${apiKey}`)
    .then(response => response.json())
    .then((data) => {
      console.log(data);

      data.Search.forEach((result) => {
        let poster = null
        result.Poster === "N/A" ? poster = "images/movie-web.jpg" : poster = result.Poster
        const movie = `
<div class="movie-card m-4 d-flex flex-column align-items-center" data-imdb="${result.imdbID}">
  <a href="#"></a>
  <div class=" movie-img" style="background-image: url('${poster}');">
    <a href="#"></a>
    <a href="#">
  </div>
  <div class="movie-card-content p-3">
    <h2>${result.Title}(${result.Year})</h2>
  </div>
</div>`;
        results.insertAdjacentHTML("beforeend", movie);

      });
    });
  });




















};




export { movieSearch }

    // <div id="addmovie" class="btn-underline-hover my-2 d-flex justify-content-start" style="margin-left: 185px;">
    //   <div><i class="fas fa-plus"></i></div>
    //   <div class="btn-underline-white ml-2"><p>Ajouter au cercle</p></div>
    // </div>
    // </a>
