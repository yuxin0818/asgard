bar = document.getElementById("progressBar");
submit = document.getElementById("submit");
warning = document.getElementById("warning");
clicks = 0;

warning.hidden = true;
bar.hidden = true;
submit.addEventListener("click", submitted);

function submitted() {
    if (clicks >= 1) {
        return;
    }
    clicks += 1;
    warning.hidden = false;
    bar.hidden = false;
}
