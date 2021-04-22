const openModal = document.querySelector(".open-modal");
const modal = document.querySelector(".modal");
const closeModal = document.querySelector(".close-modal");

openModal.addEventListener("click", function() {
    console.log(modal.classList);
    modal.classList.remove("hidden");
})

closeModal.addEventListener("click", function () {
    console.log(modal.classList);
    modal.classList.add("hidden");
});