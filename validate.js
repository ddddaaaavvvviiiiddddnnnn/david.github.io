// Example JavaScript for form validation
function validateForm() {
    var username = document.forms["myForm"]["username"].value;
    var password = document.forms["myForm"]["password"].value;
    var email = document.forms["myForm"]["email"].value;
    if (username == "" || password == "" || email == "") {
        alert("All fields must be filled out");
        return false;
    }
}
