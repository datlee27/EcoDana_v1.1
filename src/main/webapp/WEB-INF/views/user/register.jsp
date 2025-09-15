<!-- WEB-INF/views/user/register.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../head.jsp">
    <jsp:param name="pageTitle" value="Register - EvoDana" />
</jsp:include>

<jsp:include page="../body.jsp" />

<!-- Registration Page -->
<div id="register-page" class="page">
    <div class="min-h-screen bg-gradient-to-br from-secondary to-primary flex items-center justify-center pt-16 pb-8">
        <div class="bg-white p-8 rounded-xl shadow-2xl w-full max-w-md">
            <!-- Current Date and Time -->
            <div class="text-center mb-4">
                <p class="text-sm text-gray-600">
                    Current Date and Time: 
                    <fmt:formatDate value="<%= new java.util.Date() %>" pattern="hh:mm a zzz 'on' EEEE, MMMM dd, yyyy" 
                                    timeZone="GMT+07:00" />
                    <!-- Output example: 03:36 PM +07 on Sunday, September 14, 2025 -->
                </p>
            </div>

            <div class="text-center mb-8">
                <div class="text-3xl font-bold text-primary mb-2">
                    <i class="fas fa-leaf mr-2"></i>EvoDana
                </div>
                <h2 class="text-2xl font-semibold text-gray-800">Create Account</h2>
            </div>
            <form id="register-form" action="${pageContext.request.contextPath}/register" method="POST" enctype="multipart/form-data">
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-medium mb-2">Username</label>
                    <input type="text" name="username" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent" placeholder="Choose a username" required>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-medium mb-2">Email</label>
                    <input type="email" name="email" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent" placeholder="Enter your email" required>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-medium mb-2">Phone Number</label>
                    <input type="tel" name="phoneNumber" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent" placeholder="Enter your phone number" required>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-medium mb-2">Password</label>
                    <input type="password" name="password" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent" placeholder="Create a password" required>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-medium mb-2">Confirm Password</label>
                    <input type="password" name="confirmPassword" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent" placeholder="Confirm your password" required>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-medium mb-2">Driver's License (Optional)</label>
                    <input type="file" name="driversLicense" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent">
                    <p class="text-xs text-gray-500 mt-1">Required for electric cars and some motorcycles</p>
                </div>
                <div class="mb-6">
                    <label class="flex items-center">
                        <input type="checkbox" name="terms" class="mr-2" required>
                        <span class="text-sm text-gray-700">I agree to the <a href="#" class="text-secondary hover:underline">Terms & Conditions</a></span>
                    </label>
                </div>
                <button type="submit" class="w-full bg-primary text-white py-3 rounded-lg font-semibold hover:bg-accent transition-colors mb-4">
                    Register
                </button>
            </form>
            <div class="mt-6 text-center">
                <span class="text-gray-600">Already have an account? </span>
                <a href="${pageContext.request.contextPath}/login" class="text-secondary hover:underline font-medium">Login</a>
            </div>
            <div class="mt-4 text-center">
                <a href="${pageContext.request.contextPath}/home" class="text-gray-500 hover:text-gray-700">← Back to Home</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp" />