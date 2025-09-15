<!-- WEB-INF/views/renter/renter.jsp (Staff Dashboard) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../head.jsp">
    <jsp:param name="pageTitle" value="Staff Dashboard - EvoDana" />
</jsp:include>

<jsp:include page="../body.jsp" />

<!-- Staff Dashboard -->
<div id="staff-page" class="page">
    <div class="pt-20 pb-8 bg-gray-50 min-h-screen">
        <div class="max-w-7xl mx-auto px-4">
            <div class="bg-white rounded-xl shadow-lg p-8">
                <!-- Current Date and Time -->
                <div class="text-center mb-4">
                    <p class="text-sm text-gray-600">
                        Current Date and Time: 
                        <fmt:formatDate value="<%= new java.util.Date() %>" pattern="hh:mm a zzz 'on' EEEE, MMMM dd, yyyy" 
                                        timeZone="GMT+07:00" />
                        <!-- Output example: 03:41 PM +07 on Sunday, September 14, 2025 -->
                    </p>
                </div>

                <div class="flex justify-between items-center mb-8">
                    <h2 class="text-2xl font-bold text-gray-800">Staff Dashboard</h2>
                    <a href="${pageContext.request.contextPath}/logout" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-colors">
                        <i class="fas fa-sign-out-alt mr-2"></i>Logout
                    </a>
                </div>

                <!-- Tabs -->
                <div class="mb-6">
                    <div class="border-b border-gray-200">
                        <nav class="-mb-px flex space-x-8">
                            <button onclick="showStaffTab('manage-vehicles')" class="staff-tab-button py-2 px-1 border-b-2 border-primary text-primary font-medium">Manage Vehicles</button>
                            <button onclick="showStaffTab('handle-bookings')" class="staff-tab-button py-2 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700">Handle Bookings</button>
                            <button onclick="showStaffTab('condition-logs')" class="staff-tab-button py-2 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700">Condition Logs</button>
                        </nav>
                    </div>
                </div>

                <!-- Manage Vehicles Tab -->
                <div id="manage-vehicles-tab" class="staff-tab-content">
                    <h3 class="text-lg font-semibold mb-4">Manage Vehicles</h3>
                    <div class="mb-4">
                        <a href="${pageContext.request.contextPath}/add-vehicle" class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-accent transition-colors">
                            <i class="fas fa-plus mr-2"></i>Add New Vehicle
                        </a>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm text-left text-gray-500">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th class="px-4 py-2">ID</th>
                                    <th class="px-4 py-2">Model</th>
                                    <th class="px-4 py-2">Brand</th>
                                    <th class="px-4 py-2">Type</th>
                                    <th class="px-4 py-2">Status</th>
                                    <th class="px-4 py-2">License Req.</th>
                                    <th class="px-4 py-2">Battery (kWh)</th>
                                    <th class="px-4 py-2">Price/Day</th>
                                    <th class="px-4 py-2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="bg-white border-b hover:bg-gray-50">
                                    <td class="px-4 py-2">1</td>
                                    <td class="px-4 py-2">Tesla Model 3</td>
                                    <td class="px-4 py-2">Tesla</td>
                                    <td class="px-4 py-2">Electric Car</td>
                                    <td class="px-4 py-2">Available</td>
                                    <td class="px-4 py-2">Yes</td>
                                    <td class="px-4 py-2">75</td>
                                    <td class="px-4 py-2">$89</td>
                                    <td class="px-4 py-2">
                                        <a href="${pageContext.request.contextPath}/edit-vehicle?id=1" class="text-blue-500 hover:text-blue-700"><i class="fas fa-edit"></i></a>
                                        <a href="${pageContext.request.contextPath}/delete-vehicle?id=1" class="text-red-500 hover:text-red-700 ml-2" onclick="return confirm('Are you sure?')"><i class="fas fa-trash"></i></a>
                                    </td>
                                </tr>
                                <tr class="bg-white border-b hover:bg-gray-50">
                                    <td class="px-4 py-2">2</td>
                                    <td class="px-4 py-2">VinFast Klara</td>
                                    <td class="px-4 py-2">VinFast</td>
                                    <td class="px-4 py-2">Electric Motorcycle</td>
                                    <td class="px-4 py-2">Rented</td>
                                    <td class="px-4 py-2">No</td>
                                    <td class="px-4 py-2">1.5</td>
                                    <td class="px-4 py-2">$25</td>
                                    <td class="px-4 py-2">
                                        <a href="${pageContext.request.contextPath}/edit-vehicle?id=2" class="text-blue-500 hover:text-blue-700"><i class="fas fa-edit"></i></a>
                                        <a href="${pageContext.request.contextPath}/delete-vehicle?id=2" class="text-red-500 hover:text-red-700 ml-2" onclick="return confirm('Are you sure?')"><i class="fas fa-trash"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Handle Bookings Tab -->
                <div id="handle-bookings-tab" class="staff-tab-content hidden">
                    <h3 class="text-lg font-semibold mb-4">Handle Bookings</h3>
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm text-left text-gray-500">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th class="px-4 py-2">ID</th>
                                    <th class="px-4 py-2">Customer</th>
                                    <th class="px-4 py-2">Vehicle</th>
                                    <th class="px-4 py-2">Dates</th>
                                    <th class="px-4 py-2">Status</th>
                                    <th class="px-4 py-2">Amount</th>
                                    <th class="px-4 py-2">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="bg-white border-b hover:bg-gray-50">
                                    <td class="px-4 py-2">1</td>
                                    <td class="px-4 py-2">John Doe</td>
                                    <td class="px-4 py-2">Tesla Model 3</td>
                                    <td class="px-4 py-2">Dec 15-18</td>
                                    <td class="px-4 py-2">Pending</td>
                                    <td class="px-4 py-2">$267</td>
                                    <td class="px-4 py-2">
                                        <a href="${pageContext.request.contextPath}/approve-booking?id=1" class="text-green-500 hover:text-green-700"><i class="fas fa-check"></i></a>
                                        <a href="${pageContext.request.contextPath}/reject-booking?id=1" class="text-red-500 hover:text-red-700 ml-2"><i class="fas fa-times"></i></a>
                                        <a href="${pageContext.request.contextPath}/view-booking?id=1" class="text-blue-500 hover:text-blue-700 ml-2"><i class="fas fa-eye"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Condition Logs Tab -->
                <div id="condition-logs-tab" class="staff-tab-content hidden">
                    <h3 class="text-lg font-semibold mb-4">Vehicle Condition Logs</h3>
                    <form action="${pageContext.request.contextPath}/submit-log" method="POST" enctype="multipart/form-data" class="bg-gray-50 p-6 rounded-lg mb-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium mb-2">Vehicle</label>
                                <select name="vehicle" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                    <option>Tesla Model 3</option>
                                    <option>VinFast Klara</option>
                                </select>
                            </div>
                            <div>
                                <label class="block text-sm font-medium mb-2">Check Type</label>
                                <select name="checkType" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                    <option>Pre-Rental</option>
                                    <option>Post-Rental</option>
                                </select>
                            </div>
                            <div>
                                <label class="block text-sm font-medium mb-2">Odometer (km)</label>
                                <input type="number" name="odometer" class="w-full border border-gray-300 rounded-lg px-3 py-2" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium mb-2">Fuel/Battery Level (%)</label>
                                <input type="number" name="batteryLevel" class="w-full border border-gray-300 rounded-lg px-3 py-2" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium mb-2">Condition Status</label>
                                <select name="conditionStatus" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                    <option>Good</option>
                                    <option>Damaged</option>
                                </select>
                            </div>
                            <div>
                                <label class="block text-sm font-medium mb-2">Description</label>
                                <textarea name="description" class="w-full border border-gray-300 rounded-lg px-3 py-2 h-24"></textarea>
                            </div>
                            <div>
                                <label class="block text-sm font-medium mb-2">Damage Images</label>
                                <input type="file" name="damageImages" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                            </div>
                        </div>
                        <button type="submit" class="mt-4 bg-primary text-white px-6 py-2 rounded-lg hover:bg-accent transition-colors">
                            Submit Log
                        </button>
                    </form>
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm text-left text-gray-500">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th class="px-4 py-2">Vehicle</th>
                                    <th class="px-4 py-2">Check Type</th>
                                    <th class="px-4 py-2">Odometer</th>
                                    <th class="px-4 py-2">Level (%)</th>
                                    <th class="px-4 py-2">Status</th>
                                    <th class="px-4 py-2">Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="bg-white border-b hover:bg-gray-50">
                                    <td class="px-4 py-2">Tesla Model 3</td>
                                    <td class="px-4 py-2">Pre-Rental</td>
                                    <td class="px-4 py-2">5000</td>
                                    <td class="px-4 py-2">90</td>
                                    <td class="px-4 py-2">Good</td>
                                    <td class="px-4 py-2">Dec 14, 2024</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="../footer.jsp" />

<script>
    // Show staff tab function
    function showStaffTab(tabId) {
        document.querySelectorAll('.staff-tab-content').forEach(tab => tab.classList.add('hidden'));
        document.getElementById(tabId + '-tab').classList.remove('hidden');
        document.querySelectorAll('.staff-tab-button').forEach(button => button.classList.remove('border-primary', 'text-primary'));
        document.querySelector(`[onclick="showStaffTab('${tabId}')"]`).classList.add('border-primary', 'text-primary');
    }

    // Initialize default tab
    document.addEventListener('DOMContentLoaded', () => {
        showStaffTab('manage-vehicles'); // Default tab
    });
</script>