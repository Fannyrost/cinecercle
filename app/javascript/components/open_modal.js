const openModal = () => {

  const button = document.querySelector('#open-modal');
  if (button === undefined)
    return
  button.addEventListener('click', (event) => {
    event.preventDefault();
    console.log('je suis dans event listener');
    const form = document.querySelector('#modal-form');
    form.classList.remove('hidden');

  })
};


  export { openModal }
