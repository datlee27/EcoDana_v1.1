<!-- WEB-INF/views/user/dashboard.jsp (User Dashboard) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../head.jsp">
    <jsp:param name="pageTitle" value="User Dashboard - EvoDana" />
</jsp:include>

<jsp:include page="../body.jsp" />

<!-- User Dashboard -->
<div id="dashboard-page" class="page">
    <div class="pt-20 pb-8 bg-gray-50 min-h-screen">
        <div class="max-w-7xl mx-auto px-4">
            <div class="bg-white rounded-xl shadow-lg p-8">
                <!-- Current Date and Time -->
                <div class="text-center mb-4">
                    <p class="text-sm text-gray-600">
                        Current Date and Time: 
                        <fmt:formatDate value="<%= new java.util.Date() %>" pattern="hh:mm a zzz 'on' EEEE, MMMM dd, yyyy" 
                                        timeZone="GMT+07:00" />
                        <!-- Output example: 03:38 PM +07 on Sunday, September 14, 2025 -->
                    </p>
                </div>

                <div class="flex justify-between items-center mb-8">
                    <h2 class="text-2xl font-bold text-gray-800">User Dashboard</h2>
                    <a href="${pageContext.request.contextPath}/logout" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-colors">
                        <i class="fas fa-sign-out-alt mr-2"></i>Logout
                    </a>
                </div>

                <!-- User Profile -->
                <div class="bg-gray-50 p-6 rounded-lg mb-8">
                    <h3 class="text-lg font-semibold mb-4">Profile Information</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <p class="text-sm text-gray-600">Username</p>
                            <p class="font-semibold" id="user-username">${sessionScope.currentUser.username}</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Email</p>
                            <p class="font-semibold" id="user-email">${sessionScope.currentUser.email}</p>
                        </div>
                    </div>
                    <div class="mt-4">
                        <button class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-accent transition-colors" onclick="uploadLicense()">
                            <i class="fas fa-upload mr-2"></i>Upload Driver's License
                        </button>
                    </div>
                </div>

                <!-- Tabs -->
                <div class="mb-6">
                    <div class="border-b border-gray-200">
                        <nav class="-mb-px flex space-x-8">
                            <button onclick="showTab('bookings')" class="tab-button py-2 px-1 border-b-2 border-primary text-primary font-medium">My Bookings</button>
                            <button onclick="showTab('favorites')" class="tab-button py-2 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700">Favorites</button>
                            <button onclick="showTab('feedback')" class="tab-button py-2 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700">Feedback</button>
                        </nav>
                    </div>
                </div>

                <!-- Tab Content -->
                <div id="bookings-tab" class="tab-content">
                    <h3 class="text-lg font-semibold mb-4">My Bookings</h3>
                    <div class="space-y-4">
                        <div class="border border-gray-200 rounded-lg p-4">
                            <div class="flex justify-between items-start">
                                <div>
                                    <h4 class="font-semibold">Tesla Model 3</h4>
                                    <p class="text-sm text-gray-600">Dec 15, 2024 - Dec 18, 2024</p>
                                    <p class="text-sm text-green-600 font-medium">Confirmed</p>
                                </div>
                                <div class="text-right">
                                    <p class="font-semibold">$267.00</p>
                                    <a href="${pageContext.request.contextPath}/booking-details?bookingId=1" class="text-sm text-secondary hover:underline">View Details</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-gray-200 rounded-lg p-4">
                            <div class="flex justify-between items-start">
                                <div>
                                    <h4 class="font-semibold">VinFast Klara</h4>
                                    <p class="text-sm text-gray-600">Dec 10, 2024 - Dec 12, 2024</p>
                                    <p class="text-sm text-gray-600 font-medium">Completed</p>
                                </div>
                                <div class="text-right">
                                    <p class="font-semibold">$50.00</p>
                                    <a href="${pageContext.request.contextPath}/leave-review?bookingId=2" class="text-sm text-secondary hover:underline">Leave Review</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="favorites-tab" class="tab-content hidden">
                    <h3 class="text-lg font-semibold mb-4">Favorite Vehicles</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="border border-gray-200 rounded-lg p-4">
                            <div class="h-32 bg-gradient-to-br from-primary to-secondary rounded-lg flex items-center justify-center mb-4">
                                <i class="fas fa-car text-4xl text-white"></i>
                            </div>
                            <h4 class="font-semibold mb-2">Tesla Model 3</h4>
                            <p class="text-sm text-gray-600 mb-3">$89/day</p>
                            <div class="flex space-x-2">
                                <a href="${pageContext.request.contextPath}/book-now?vehicle=Tesla Model 3" class="flex-1 bg-primary text-white py-2 rounded-lg text-sm hover:bg-accent transition-colors text-center">Book Now</a>
                                <button class="px-3 py-2 bg-gray-200 text-gray-600 rounded-lg hover:bg-gray-300 transition-colors" onclick="removeFavorite('Tesla Model 3')">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="feedback-tab" class="tab-content hidden">
                    <h3 class="text-lg font-semibold mb-4">Submit Feedback</h3>
                    <form id="feedback-form" action="${pageContext.request.contextPath}/submit-feedback" method="POST" class="space-y-4">
                        <div>
                            <label class="block text-sm font-medium mb-2">Select Booking</label>
                            <select name="booking" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                <option value="VinFast Klara - Dec 10-12, 2024">VinFast Klara - Dec 10-12, 2024</option>
                                <option value="Honda CBR 150R - Nov 25-27, 2024">Honda CBR 150R - Nov 25-27, 2024</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium mb-2">Rating</label>
                            <div class="flex space-x-2" id="star-rating">
                                <button type="button" class="star text-2xl text-gray-300 hover:text-yellow-400" onclick="setRating(1)">★</button>
                                <button type="button" class="star text-2xl text-gray-300 hover:text-yellow-400" onclick="setRating(2)">★</button>
                                <button type="button" class="star text-2xl text-gray-300 hover:text-yellow-400" onclick="setRating(3)">★</button>
                                <button type="button" class="star text-2xl text-gray-300 hover:text-yellow-400" onclick="setRating(4)">★</button>
                                <button type="button" class="star text-2xl text-gray-300 hover:text-yellow-400" onclick="setRating(5)">★</button>
                            </div>
                            <input type="hidden" name="rating" id="rating-value">
                        </div>
                        <div>
                            <label class="block text-sm font-medium mb-2">Comments</label>
                            <textarea name="comments" class="w-full border border-gray-300 rounded-lg px-3 py-2 h-24" placeholder="Share your experience..."></textarea>
                        </div>
                        <button type="submit" class="bg-primary text-white px-6 py-2 rounded-lg hover:bg-accent transition-colors">
                            Submit Feedback
                        </button>
                    </form>
                </div>
            </div>
            <div class="mt-4 text-center">
                <a href="${pageContext.request.contextPath}/home" class="text-gray-500 hover:text-gray-700">← Back to Home</a>
            </div>
        </div>
    </div>

<jsp:include page="../footer.jsp" />

<script>
    // Show tab function
    function showTab(tabId) {
        document.querySelectorAll('.tab-content').forEach(tab => tab.classList.add('hidden'));
        document.getElementById(tabId + '-tab').classList.remove('hidden');
        document.querySelectorAll('.tab-button').forEach(button => button.classList.remove('border-primary', 'text-primary'));
        document.querySelector(`[onclick="showTab('${tabId}')"]`).classList.add('border-primary', 'text-primary');
    }

    // Set rating function
    let currentRating = 0;
    function setRating(rating) {
        currentRating = rating;
        document.getElementById('rating-value').value = rating;
        const stars = document.querySelectorAll('.star');
        stars.forEach((star, index) => {
            if (index < rating) {
                star.classList.remove('text-gray-300');
                star.classList.add('text-yellow-400');
            } else {
                star.classList.remove('text-yellow-400');
                star.classList.add('text-gray-300');
            }
        });
    }

    // Upload license function (placeholder)
    function uploadLicense() {
        alert('Upload Driver\'s License functionality to be implemented.');
        // Add logic to handle file upload (e.g., trigger file input or AJAX)
    }

    // Remove favorite function (placeholder)
    function removeFavorite(vehicle) {
        if (confirm(`Remove ${vehicle} from favorites?`)) {
            alert(`${vehicle} removed from favorites.`);
            // Add logic to update server-side favorites
        }
    }

    // Initialize default tab
    document.addEventListener('DOMContentLoaded', () => {
        showTab('bookings'); // Default tab
    });
</script>