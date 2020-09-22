const addReco = () => {

  const button = document.querySelector('#add-reco');

  if (button === undefined)
    return
  console.log('je suis dans addReco');

  button.addEventListener('click', (event) => {
    console.log('je suis dans event listener');
    const form = document.querySelector('#reco-form');
    form.classList.toggle('hidden');

  })
};


  export { addReco }
