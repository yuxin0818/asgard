//Get elements and establish variables
bar = document.getElementById("progress-bar");
submit = document.getElementById("submit");
warning = document.getElementById("warning");
clicks = 0;

//Hide text and add event listener
warning.hidden = true;
bar.hidden = true;
submit.addEventListener("click",submitted);

//Runs if button is clicked:
function submitted(){
    if (clicks >= 1){
        return;
    }
    clicks += 1;
    warning.hidden = false;
    bar.hidden = false;
}