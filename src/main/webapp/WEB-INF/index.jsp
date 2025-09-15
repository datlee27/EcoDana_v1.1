<!-- index.jsp (Trang chủ - Home Page) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="views/head.jsp">
    <jsp:param name="pageTitle" value="EvoDana - Electric Vehicle Rentals" />
</jsp:include>

<jsp:include page="views/body.jsp" />

    <!-- Homepage -->
    <div id="home-page" class="page">
        <!-- Hero Section -->
        <section class="hero-bg min-h-screen flex items-center justify-center text-white pt-16">
            <div class="text-center max-w-4xl mx-auto px-4">
                <h1 class="text-5xl md:text-6xl font-bold mb-6 fade-in">
                    Rent Electric Vehicles & Motorcycles with EvoDana
                </h1>
                <p class="text-xl mb-8 fade-in">Sustainable transportation for the modern world</p>
                <button onclick="showPage('vehicles')" class="bg-white text-primary px-8 py-4 rounded-lg text-lg font-semibold hover:bg-gray-100 transition-colors fade-in">
                    Browse Vehicles
                </button>
            </div>
        </section>

        <!-- Search Bar -->
        <section class="bg-white py-8 shadow-lg">
            <div class="max-w-6xl mx-auto px-4">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <select class="border border-gray-300 rounded-lg px-4 py-3 focus:ring-2 focus:ring-primary focus:border-transparent">
                        <option>Vehicle Type</option>
                        <option>Electric Car</option>
                        <option>Motorcycle</option>
                        <option>Electric Motorcycle</option>
                    </select>
                    <input type="text" placeholder="Location" class="border border-gray-300 rounded-lg px-4 py-3 focus:ring-2 focus:ring-primary focus:border-transparent">
                    <input type="date" class="border border-gray-300 rounded-lg px-4 py-3 focus:ring-2 focus:ring-primary focus:border-transparent">
                    <button class="bg-primary text-white px-6 py-3 rounded-lg hover:bg-accent transition-colors">
                        <i class="fas fa-search mr-2"></i>Search
                    </button>
                </div>
            </div>
        </section>

        <!-- Featured Vehicles -->
        <section class="py-16 bg-gray-50">
            <div class="max-w-7xl mx-auto px-4">
                <h2 class="text-3xl font-bold text-center mb-12 text-gray-800">Featured Vehicles</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <div class="vehicle-card bg-white rounded-xl shadow-lg overflow-hidden">
                        <div class="h-48 bg-gradient-to-br from-primary to-secondary flex items-center justify-center">
                            <i class="fas fa-car text-6xl text-white"></i>
                        </div>
                        <div class="p-6">
                            <h3 class="text-xl font-semibold mb-2">Tesla Model 3</h3>
                            <p class="text-gray-600 mb-4">Electric Car</p>
                            <div class="flex justify-between items-center">
                                <span class="text-2xl font-bold text-primary">$89/day</span>
                                <button onclick="showVehicleDetail('tesla-model-3')" class="bg-secondary text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition-colors">Book Now</button>
                            </div>
                        </div>
                    </div>
                    <div class="vehicle-card bg-white rounded-xl shadow-lg overflow-hidden">
                        <div class="h-48 bg-gradient-to-br from-secondary to-primary flex items-center justify-center">
                            <i class="fas fa-motorcycle text-6xl text-white"></i>
                        </div>
                        <div class="p-6">
                            <h3 class="text-xl font-semibold mb-2">VinFast Klara</h3>
                            <p class="text-gray-600 mb-4">Electric Motorcycle</p>
                            <div class="flex justify-between items-center">
                                <span class="text-2xl font-bold text-primary">$25/day</span>
                                <button onclick="showVehicleDetail('vinfast-klara')" class="bg-secondary text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition-colors">Book Now</button>
                            </div>
                        </div>
                    </div>
                    <div class="vehicle-card bg-white rounded-xl shadow-lg overflow-hidden">
                        <div class="h-48 bg-gradient-to-br from-accent to-primary flex items-center justify-center">
                            <i class="fas fa-motorcycle text-6xl text-white"></i>
                        </div>
                        <div class="p-6">
                            <h3 class="text-xl font-semibold mb-2">Honda CBR 150R</h3>
                            <p class="text-gray-600 mb-4">Gasoline Motorcycle</p>
                            <div class="flex justify-between items-center">
                                <span class="text-2xl font-bold text-primary">$35/day</span>
                                <button onclick="showVehicleDetail('honda-cbr')" class="bg-secondary text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition-colors">Book Now</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Why Choose Us -->
        <section class="py-16 bg-white">
            <div class="max-w-7xl mx-auto px-4">
                <h2 class="text-3xl font-bold text-center mb-12 text-gray-800">Why Choose EvoDana?</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div class="text-center">
                        <div class="w-16 h-16 bg-primary rounded-full flex items-center justify-center mx-auto mb-4">
                            <i class="fas fa-leaf text-2xl text-white"></i>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Eco-Friendly</h3>
                        <p class="text-gray-600">Reduce your carbon footprint with our electric vehicle fleet</p>
                    </div>
                    <div class="text-center">
                        <div class="w-16 h-16 bg-secondary rounded-full flex items-center justify-center mx-auto mb-4">
                            <i class="fas fa-clock text-2xl text-white"></i>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Flexible Rentals</h3>
                        <p class="text-gray-600">Hourly, daily, or monthly rentals to fit your needs</p>
                    </div>
                    <div class="text-center">
                        <div class="w-16 h-16 bg-accent rounded-full flex items-center justify-center mx-auto mb-4">
                            <i class="fas fa-headset text-2xl text-white"></i>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">24/7 Support</h3>
                        <p class="text-gray-600">Round-the-clock customer support for your peace of mind</p>
                    </div>
                </div>
            </div>
        </section>
    </div>

<jsp:include page="views/footer.jsp" />