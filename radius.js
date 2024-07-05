function displayVolume() {
    var radius = parseFloat(document.getElementById('radius').value);
    if (isNaN(radius)) {
      alert('Please enter a valid number for the radius.');
      return;
    }
    
    var volume = (4/3) * Math.PI * Math.pow(radius, 3);
    var volumeDisplay = document.getElementById('volumeDisplay');
    volumeDisplay.innerHTML = '<p>Volume of the sphere with radius ' + radius + ' units is: ' + volume.toFixed(2) + ' cubic units.</p>';
  }
  
  document.getElementById('volumeForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent form submission
    var radius = parseFloat(document.getElementById('radius').value);
    if (isNaN(radius)) {
      alert('Please enter a valid number for the radius.');
      return;
    }
    
    var volume = (4/3) * Math.PI * Math.pow(radius, 3);
    var resultElement = document.getElementById('result');
    resultElement.innerHTML = '<p>Volume of the sphere with radius ' + radius + ' units is: ' + volume.toFixed(2) + ' cubic units.</p>';
  });
  