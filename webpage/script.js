/**
 * Makes an API call to calculate the exponent of a number
 * @param {string} firstName - User's first name
 * @param {string} lastName - User's last name
 * @param {number} base - The base number to be raised to a power
 * @param {number} exponent - The power to raise the base number to
 */

var callAPI = (firstName, lastName, base, exponent) => {
    // Input validation
    if (!firstName || !lastName) {
        alert("Please enter both first and last name");
        return;
    }
    
    // Create a new Headers object for the HTTP request
    var myHeaders = new Headers();
    
    // Specify that we're sending JSON data
    myHeaders.append("Content-Type", "application/json");
    
    // Create the JSON payload with all fields
    var raw = JSON.stringify({
        "firstName": firstName,
        "lastName": lastName,
        "base": base,
        "exponent": exponent
    });
    
    // Configure the HTTP request options
    var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: raw,
        redirect: 'follow'
    };
    
    // Make the API call using the Fetch API
    fetch("https://sf2znk7lo2.execute-api.us-east-1.amazonaws.com/dev", requestOptions)
        .then(response => response.text())
        .then(result => {
            // Parse the response and show the result
            const data = JSON.parse(result);
            alert(`Result for ${firstName} ${lastName}: ${data.body}`);
        })
        .catch(error => {
            console.log('error', error);
            alert('An error occurred while calculating');
        });
}