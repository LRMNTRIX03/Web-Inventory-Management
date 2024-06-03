const menu = document.querySelector(".menu_km");
const wrapper = document.querySelector("#wrapper_isi_menu_km");

menu.addEventListener("click", (e) => {
    e.preventDefault();
    menu.querySelector(".fa-chevron-left").classList.toggle("fa-chevron-right");

    if (wrapper.style.display === "block") {
        wrapper.style.display = "none";
    } else {
        wrapper.style.display = "block";
    }
})