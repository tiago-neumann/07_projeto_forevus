fetch("../assets/html/barra_navegacao.html")
    .then(response => response.text())
    .then(data => {
        document.querySelector('header').innerHTML = data;
    });