document.addEventListener('DOMContentLoaded', () => {
    fetch('projects.json')
        .then(response => response.json())
        .then(data => {
            const projectsList = document.getElementById('projects-list');
            data.projects.forEach(project => {
                const projectItem = document.createElement('div');
                projectItem.classList.add('project-item');
                projectItem.innerHTML = `
                    <h3>${project.name}</h3>
                    <p>${project.description}</p>
                    <a href="${project.link}" target="_blank">View Project</a>
                `;
                projectsList.appendChild(projectItem);
            });
        });
});
