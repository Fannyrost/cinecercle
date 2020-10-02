const tabs = () => {
  console.log('in tabs')
  const tabs      = document.querySelectorAll('.tab');

  tabs.forEach(tab => {
    tab.addEventListener('click', (event) => {
      event.preventDefault();
      const activeTab = document.querySelector('.active');
      tab.classList.toggle("active");
      activeTab.classList.toggle("active");

      const newActiveTab = document.querySelector('.active');
      const contents = document.querySelectorAll('.tab-content');

      contents.forEach(content => {
        const typeOfTab = newActiveTab.className.split(" ")[0]
        const activeContent = document.querySelector('.on')
        if (content.classList.contains(typeOfTab)) {
          content.classList.toggle('on');
          activeContent.classList.toggle('on');
        };

      });

      });


    });

}


export { tabs }
