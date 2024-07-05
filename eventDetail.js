// events.js
document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/events')
        .then(response => response.json())
        .then(events => {
            const eventList = document.getElementById('event-list');
            events.forEach(event => {
                const eventItem = document.createElement('div');
                eventItem.classList.add('event-item');
                eventItem.innerHTML = `
                    <h2>${event.title}</h2>
                    <p>${event.date}</p>
                    <a href="/event/${event.id}">Details</a>
                `;
                eventList.appendChild(eventItem);
            });
        });
});

// eventDetail.js
document.addEventListener('DOMContentLoaded', () => {
    const eventId = window.location.pathname.split('/').pop();
    fetch(`/api/event/${eventId}`)
        .then(response => response.json())
        .then(event => {
            const eventDetail = document.getElementById('event-detail');
            eventDetail.innerHTML = `
                <h2>${event.title}</h2>
                <p>${event.date}</p>
                <p>${event.description}</p>
            `;
        });

    const registerButton = document.getElementById('register-button');
    registerButton.addEventListener('click', () => {
        fetch(`/api/register/${eventId}`, { method: 'POST' })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Successfully registered for the event!');
                }
            });
    });
});

// dashboard.js
document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/user')
        .then(response => response.json())
        .then(user => {
            const userInfo = document.getElementById('user-info');
            userInfo.innerHTML = `<h2>Welcome, ${user.name}</h2>`;
        });

    fetch('/api/user/registered-events')
        .then(response => response.json())
        .then(events => {
            const registeredEvents = document.getElementById('registered-events');
            events.forEach(event => {
                const eventItem = document.createElement('div');
                eventItem.classList.add('event-item');
                eventItem.innerHTML = `
                    <h2>${event.title}</h2>
                    <p>${event.date}</p>
                `;
                registeredEvents.appendChild(eventItem);
            });
        });
});
