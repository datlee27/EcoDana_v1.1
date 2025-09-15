<!-- WEB-INF/views/vehicle-detail.jsp (Vehicle Detail Page - Có thể đặt trong user hoặc riêng) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="Vehicle Detail - EvoDana" />
</jsp:include>

<jsp:include page="body.jsp" />

    <!-- Vehicle Detail Page -->
    <div id="vehicle-detail-page" class="page">
        <div class="pt-20 pb-8 bg-gray-50 min-h-screen">
            <div class="max-w-7xl mx-auto px-4">
                <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 p-8">
                        <!-- Vehicle Images -->
                        <div>
                            <div class="mb-4">
                                <div id="main-vehicle-image" class="h-80 bg-gradient-to-br from-primary to-secondary rounded-lg flex items-center justify-center">
                                    <i class="fas fa-car text-8xl text-white"></i>
                                </div>
                            </div>
                            <div class="grid grid-cols-4 gap-2">
                                <div class="h-20 bg-gradient-to-br from-primary to-secondary rounded-lg flex items-center justify-center cursor-pointer">
                                    <i class="fas fa-car text-2xl text-white"></i>
                                </div>
                                <div class="h-20 bg-gradient-to-br from-secondary to-primary rounded-lg flex items-center justify-center cursor-pointer">
                                    <i class="fas fa-car text-2xl text-white"></i>
                                </div>
                                <div class="h-20 bg-gradient-to-br from-accent to-primary rounded-lg flex items-center justify-center cursor-pointer">
                                    <i class="fas fa-car text-2xl text-white"></i>
                                </div>
                                <div class="h-20 bg-gradient-to-br from-primary to-accent rounded-lg flex items-center justify-center cursor-pointer">
                                    <i class="fas fa-car text-2xl text-white"></i>
                                </div>
                            </div>
                        </div>

                        <!-- Vehicle Details -->
                        <div>
                            <div class="mb-6">
                                <h1 id="vehicle-title" class="text-3xl font-bold text-gray-800 mb-2">Tesla Model 3</h1>
                                <p class="text-gray-600 mb-4">Electric Car • 4 Seats • 75 kWh Battery</p>
                                <div class="flex items-center space-x-4">
                                    <span class="text-3xl font-bold text-primary">$89/day</span>
                                    <span class="text-gray-500">$12/hour</span>
                                    <span class="text-gray-500">$2,400/month</span>
                                </div>
                            </div>

                            <!-- Features -->
                            <div class="mb-6">
                                <h3 class="text-lg font-semibold mb-3">Features</h3>
                                <div class="grid grid-cols-2 gap-2">
                                    <div class="flex items-center">
                                        <i class="fas fa-bolt text-primary mr-2"></i>
                                        <span class="text-sm">Fast Charging</span>
                                    </div>
                                    <div class="flex items-center">
                                        <i class="fas fa-map-marker-alt text-primary mr-2"></i>
                                        <span class="text-sm">GPS Navigation</span>
                                    </div>
                                    <div class="flex items-center">
                                        <i class="fas fa-wifi text-primary mr-2"></i>
                                        <span class="text-sm">WiFi Hotspot</span>
                                    </div>
                                    <div class="flex items-center">
                                        <i class="fas fa-snowflake text-primary mr-2"></i>
                                        <span class="text-sm">Air Conditioning</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Booking Form -->
                            <div class="bg-gray-50 p-6 rounded-lg">
                                <h3 class="text-lg font-semibold mb-4">Book This Vehicle</h3>
                                <form id="booking-form">
                                    <div class="grid grid-cols-2 gap-4 mb-4">
                                        <div>
                                            <label class="block text-sm font-medium mb-2">Pickup Date</label>
                                            <input type="date" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                        </div>
                                        <div>
                                            <label class="block text-sm font-medium mb-2">Return Date</label>
                                            <input type="date" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                        </div>
                                    </div>
                                    <div class="mb-4">
                                        <label class="block text-sm font-medium mb-2">Rental Type</label>
                                        <select class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                            <option>Daily</option>
                                            <option>Hourly</option>
                                            <option>Monthly</option>
                                        </select>
                                    </div>
                                    <div class="mb-4">
                                        <label class="block text-sm font-medium mb-2">Driver's License (Required)</label>
                                        <input type="file" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                    </div>
                                    <div class="flex space-x-4">
                                        <button type="button" class="flex-1 bg-gray-200 text-gray-700 py-3 rounded-lg font-semibold hover:bg-gray-300 transition-colors">
                                            <i class="fas fa-heart mr-2"></i>Add to Favorites
                                        </button>
                                        <button type="submit" onclick="showPage('booking-confirmation')" class="flex-1 bg-primary text-white py-3 rounded-lg font-semibold hover:bg-accent transition-colors">
                                            Book Now
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-4">
                    <button onclick="showPage('vehicles')" class="text-gray-500 hover:text-gray-700">← Back to Vehicles</button>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="footer.jsp" />