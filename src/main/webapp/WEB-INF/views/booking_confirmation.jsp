<!-- WEB-INF/views/booking-confirmation.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="Booking Confirmation - EvoDana" />
</jsp:include>

<jsp:include page="body.jsp" />

<!-- Booking Confirmation Page -->
<div id="booking-confirmation-page" class="page">
    <div class="pt-20 pb-8 bg-gray-50 min-h-screen">
        <div class="max-w-4xl mx-auto px-4">
            <div class="bg-white rounded-xl shadow-lg p-8">
                <!-- Current Date and Time -->
                <div class="text-center mb-4">
                    <p class="text-sm text-gray-600">
                        Current Date and Time: 
                        <fmt:formatDate value="<%= new java.util.Date() %>" pattern="hh:mm a zzz 'on' EEEE, MMMM dd, yyyy" 
                                        timeZone="GMT+07:00" />
                        <!-- Output example: 03:33 PM +07 on Sunday, September 14, 2025 -->
                    </p>
                </div>

                <h2 class="text-2xl font-bold text-gray-800 mb-6">Booking Confirmation</h2>
                
                <!-- Booking Summary -->
                <div class="bg-gray-50 p-6 rounded-lg mb-6">
                    <h3 class="text-lg font-semibold mb-4">Booking Summary</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <p class="text-sm text-gray-600">Vehicle</p>
                            <p class="font-semibold">Tesla Model 3</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Rental Period</p>
                            <p class="font-semibold">Dec 15, 2024 - Dec 18, 2024</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Duration</p>
                            <p class="font-semibold">3 Days</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Base Price</p>
                            <p class="font-semibold">$267.00</p>
                        </div>
                    </div>
                </div>

                <!-- Insurance Options -->
                <div class="mb-6">
                    <h3 class="text-lg font-semibold mb-4">Insurance Options</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50">
                            <input type="radio" name="insurance" class="mr-3">
                            <div class="flex-1">
                                <p class="font-medium">Basic Coverage</p>
                                <p class="text-sm text-gray-600">Standard protection included</p>
                            </div>
                            <span class="font-semibold">Free</span>
                        </label>
                        <label class="flex items-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50">
                            <input type="radio" name="insurance" class="mr-3">
                            <div class="flex-1">
                                <p class="font-medium">Premium Coverage</p>
                                <p class="text-sm text-gray-600">Enhanced protection with lower deductible</p>
                            </div>
                            <span class="font-semibold">$15/day</span>
                        </label>
                    </div>
                </div>

                <!-- Total Amount -->
                <div class="bg-primary text-white p-6 rounded-lg mb-6">
                    <div class="flex justify-between items-center">
                        <span class="text-lg">Total Amount</span>
                        <span class="text-2xl font-bold">$267.00</span>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="flex space-x-4">
                    <a href="${pageContext.request.contextPath}/vehicles?page=vehicle-detail" class="flex-1 bg-gray-200 text-gray-700 py-3 rounded-lg font-semibold hover:bg-gray-300 transition-colors text-center">
                        Back to Vehicle
                    </a>
                    <button onclick="confirmBooking()" class="flex-1 bg-secondary text-white py-3 rounded-lg font-semibold hover:bg-blue-600 transition-colors">
                        Confirm Booking
                    </button>
                </div>

                <!-- Terms Link -->
                <div class="mt-4 text-center">
                    <a href="#" class="text-sm text-gray-600 hover:underline">View Terms & Conditions</a>
                </div>

                <!-- Success/Error Messages -->
                <div id="booking-message" class="hidden mt-4 p-4 rounded-lg"></div>
            </div>
        </div>
    </div>

<jsp:include page="footer.jsp" />