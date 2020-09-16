
const movieSearch = () => {
  console.log('je suis au début de movie search')
  const form = document.querySelector('#movie-search');

  if (form === undefined)
    return
  console.log('je suis dans movie search')
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
        const movie = `<li class="list-inline-item">
        <img src="${result.Poster}" alt="">
        <p>${result.Title}</p>
        </li>`;
        results.insertAdjacentHTML("beforeend", movie);
      });
    });
  });
}


export { movieSearch }
