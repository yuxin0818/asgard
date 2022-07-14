"use strict";

var uploadButtonClicks = 0;

const uploadButton = document.getElementById("uploadButton");
const warningText = document.getElementById("warningText");
const progressBar = document.getElementById("progressBar");
const fileUploadElement = document.getElementById("fileUpload");

uploadButton.addEventListener("click", uploadFile);

function uploadFile() {
    if (uploadButtonClicks >= 1) {
        return;
    }
    uploadButtonClicks += 1;
    warningText.textContent = "Uploading " + fileUploadElement.files[0].name;
    warningText.hidden = false;
    progressBar.hidden = false;
}
