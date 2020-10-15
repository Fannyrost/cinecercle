const openModal = () => {

  const button = document.querySelector('#open-modal');
  console.log(button)
  if (button === undefined)
    return
  console.log('je suis dans openModal');

  button.addEventListener('click', (event) => {
    console.log('je suis dans event listener');
    const form = document.querySelector('#modal-form');
    form.classList.toggle('hidden');

  })
};


  export { openModal }
