// src/main/webapp/resources/js/scripts.js

document.addEventListener('DOMContentLoaded', function () {
    updateNavigation();
    initializeTabHandlers();
    initializeRatingStars();
    displayCurrentTime();
});

// Function to update navigation based on user role
function updateNavigation() {
    const navLinks = document.getElementById('nav-links');
    const authLinks = document.getElementById('auth-links');
    if (!navLinks || !authLinks) return;

    navLinks.innerHTML = '';
    authLinks.innerHTML = '';

    // Simulate session data (replace with actual session check from server)
    let currentUser = { role: 'guest' };
    if (typeof sessionStorage !== 'undefined' && sessionStorage.getItem('currentUser')) {
        currentUser = JSON.parse(sessionStorage.getItem('currentUser'));
    } else if (window.sessionScope && window.sessionScope.currentUser) {
        currentUser = window.sessionScope.currentUser; // Assuming JSP session scope is accessible
    }

    const baseUrl = window.location.pathname.includes('home') ? window.location.pathname : '/home';

    if (currentUser.role === 'guest') {
        navLinks.innerHTML = `
            <a href="${baseUrl}?page=home" class="nav-link text-gray-700 hover:text-primary transition-colors">Home</a>
            <a href="${baseUrl}?page=vehicles" class="nav-link text-gray-700 hover:text-primary transition-colors">Vehicles</a>
        `;
        authLinks.innerHTML = `
            <a href="${baseUrl}?page=login" class="text-primary hover:text-accent transition-colors">Login</a>
            <a href="${baseUrl}?page=register" class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-accent transition-colors">Sign Up</a>
        `;
    } else {
        switch (currentUser.role) {
            case 'customer':
                navLinks.innerHTML = `
                    <a href="${baseUrl}?page=home" class="nav-link text-gray-700 hover:text-primary transition-colors">Home</a>
                    <a href="${baseUrl}?page=vehicles" class="nav-link text-gray-700 hover:text-primary transition-colors">Vehicles</a>
                    <a href="${baseUrl}?page=dashboard" class="nav-link text-gray-700 hover:text-primary transition-colors">Dashboard</a>
                `;
                break;
            case 'staff':
                navLinks.innerHTML = `
                    <a href="${baseUrl}?page=home" class="nav-link text-gray-700 hover:text-primary transition-colors">Home</a>
                    <a href="${baseUrl}?page=staff" class="nav-link text-gray-700 hover:text-primary transition-colors">Staff Panel</a>
                `;
                break;
            case 'admin':
                navLinks.innerHTML = `
                    <a href="${baseUrl}?page=home" class="nav-link text-gray-700 hover:text-primary transition-colors">Home</a>
                    <a href="${baseUrl}?page=admin" class="nav-link text-gray-700 hover:text-primary transition-colors">Admin Portal</a>
                `;
                break;
        }
        authLinks.innerHTML = `
            <a href="${baseUrl}?page=logout" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-colors">Logout</a>
        `;
    }
}

// Function to initialize tab handlers for different sections
function initializeTabHandlers() {
    ['tab', 'staff-tab', 'admin-tab'].forEach(prefix => {
        document.querySelectorAll(`.${prefix}-button`).forEach(button => {
            button.addEventListener('click', function () {
                const tabId = this.getAttribute('onclick')
                    .replace(`${prefix === 'tab' ? 'show' : `show${prefix.charAt(0).toUpperCase() + prefix.slice(1)}`}Tab(`, '')
                    .replace(')', '');
                showTabHandler(tabId, prefix);
            });
        });
    });
}

function showTabHandler(tabId, prefix) {
    const contentSelector = `.${prefix}-content`;
    const buttonSelector = `.${prefix}-button`;

    document.querySelectorAll(contentSelector).forEach(tab => tab.classList.add('hidden'));
    document.getElementById(`${tabId}-tab`).classList.remove('hidden');

    document.querySelectorAll(buttonSelector).forEach(button => {
        button.className = `${prefix}-button py-2 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700`;
    });
    event.target.className = `${prefix}-button py-2 px-1 border-b-2 border-primary text-primary font-medium`;
}

// Function to initialize rating stars
function initializeRatingStars() {
    let currentRating = 0;
    document.querySelectorAll('.star').forEach(star => {
        star.addEventListener('click', function () {
            currentRating = parseInt(this.getAttribute('onclick').match(/\d+/)[0]);
            setRating(currentRating);
        });
    });
}

function setRating(rating) {
    const stars = document.querySelectorAll('.star');
    stars.forEach((star, index) => {
        star.className = index < rating ? 'star text-2xl text-yellow-400' : 'star text-2xl text-gray-300 hover:text-yellow-400';
    });
    const ratingInput = document.getElementById('rating-value');
    if (ratingInput) ratingInput.value = rating;
}

// Function to display current time
function displayCurrentTime() {
    const timeElement = document.querySelector('.current-time');
    if (timeElement) {
        const now = new Date();
        const options = {
            hour: '2-digit',
            minute: '2-digit',
            timeZoneName: 'short',
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        };
        timeElement.textContent = now.toLocaleString('en-US', options).replace(',', ' on');
        setInterval(() => {
            const updatedNow = new Date();
            timeElement.textContent = updatedNow.toLocaleString('en-US', options).replace(',', ' on');
        }, 60000); // Update every minute
    }
}

// Function to handle adding a vehicle (placeholder)
function addVehicle() {
    alert('Add Vehicle form would open here');
}