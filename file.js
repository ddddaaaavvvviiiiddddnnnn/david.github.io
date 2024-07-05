// Wait for the DOM to fully load
document.addEventListener('DOMContentLoaded', (event) => {
    const greetButton = document.getElementById('greetButton');
    const greeting = document.getElementById('greeting');

    greetButton.addEventListener('click', () => {
        greeting.textContent = 'Hello, welcome to my page!';
    });
});
