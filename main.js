document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('pet-form');
    const petList = document.getElementById('pets');

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        const formData = new FormData(form);
        
        fetch('server/add_pet.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                fetchPets();
                form.reset();
            } else {
                alert('Error adding pet.');
            }
        })
        .catch(error => console.error('Error:', error));
    });

    function fetchPets() {
        fetch('server/get_pets.php')
            .then(response => response.json())
            .then(data => {
                petList.innerHTML = '';
                data.pets.forEach(pet => {
                    const li = document.createElement('li');
                    li.textContent = `${pet.name} (${pet.species}, ${pet.age} years old)`;
                    petList.appendChild(li);
                });
            })
            .catch(error => console.error('Error:', error));
    }

    fetchPets();
});
