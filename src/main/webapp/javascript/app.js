function changeLanguage() {
    // Get the selected language from the dropdown
    var selectedLanguage = document.getElementById("langSelect").value;

    // Submit the form to set the language
    document.forms[0].submit();
}