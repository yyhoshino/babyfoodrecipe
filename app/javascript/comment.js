function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", () => {
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/recipes", true);
    XHR.responseType = "json";
    XHR.send(formData);
  });
};

window.addEventListener('load', post);