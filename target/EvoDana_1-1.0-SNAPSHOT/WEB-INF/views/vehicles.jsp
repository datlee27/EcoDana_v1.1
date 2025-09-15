<!-- WEB-INF/views/vehicles.jsp (Vehicle Listing Page) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp">
    <jsp:param name="pageTitle" value="Vehicles - EvoDana" />
</jsp:include>

<jsp:include page="body.jsp" />

    <!-- Vehicle Listing Page -->
    <div id="vehicles-page" class="page">
        <div class="pt-20 pb-8 bg-gray-50 min-h-screen">
            <div class="max-w-7xl mx-auto px-4">
                <div class="flex flex-col lg:flex-row gap-8">
                    <!-- Sidebar Filters -->
                    <div class="lg:w-1/4">
                        <div class="bg-white p-6 rounded-xl shadow-lg">
                            <h3 class="text-xl font-semibold mb-4">Filters</h3>
                            <div class="space-y-4">
                                <div>
                                    <label class="block text-sm font-medium mb-2">Vehicle Type</label>
                                    <select class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                        <option>All Types</option>
                                        <option>Electric Car</option>
                                        <option>Motorcycle</option>
                                        <option>Electric Motorcycle</option>
                                    </select>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium mb-2">Price Range</label>
                                    <select class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                        <option>All Prices</option>
                                        <option>$0 - $30</option>
                                        <option>$30 - $60</option>
                                        <option>$60+</option>
                                    </select>
                                </div>
                                <div>
                                    <label class="block text-sm font-medium mb-2">Brand</label>
                                    <select class="w-full border border-gray-300 rounded-lg px-3 py-2">
                                        <option>All Brands</option>
                                        <option>Tesla</option>
                                        <option>VinFast</option>
                                        <option>Honda</option>
                                        <option>Yamaha</option>
                                    </select>
                                </div>
                                <div>
                                    <label class="flex items-center">
                                        <input type="checkbox" class="mr-2">
                                        <span class="text-sm">No License Required</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Vehicle Grid -->
                    <div class="lg:w-3/4">
                        <div class="flex justify-between items-center mb-6">
                            <h2 class="text-2xl font-bold text-gray-800">Available Vehicles</h2>
                            <select class="border border-gray-300 rounded-lg px-3 py-2">
                                <option>Sort by Price</option>
                                <option>Sort by Rating</option>
                                <option>Sort by Newest</option>
                            </select>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6" id="vehicle-grid">
                            <!-- Vehicle cards will be populated by JavaScript -->
                        </div>
                        <div class="mt-8 flex justify-center">
                            <div class="flex space-x-2">
                                <button class="px-4 py-2 bg-primary text-white rounded-lg">1</button>
                                <button class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300">2</button>
                                <button class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300">3</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="footer.jsp" />