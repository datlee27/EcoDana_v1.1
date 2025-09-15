<!-- WEB-INF/views/user/login.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../head.jsp">
    <jsp:param name="pageTitle" value="Login - EvoDana" />
</jsp:include>

<jsp:include page="../body.jsp" />

<!-- Login Page -->
<div id="login-page" class="page">
    <div class="min-h-screen bg-gradient-to-br from-primary to-secondary flex items-center justify-center pt-16">
        <div class="bg-white p-8 rounded-xl shadow-2xl w-full max-w-md">
            <!-- Current Date and Time -->
            <div class="text-center mb-4">
                <p class="text-sm text-gray-600">
                    Current Date and Time: 
                    <fmt:formatDate value="<%= new java.util.Date() %>" pattern="hh:mm a zzz 'on' EEEE, MMMM dd, yyyy" 
                                    timeZone="GMT+07:00" />
                    <!-- Output example: 03:50 PM +07 on Sunday, September 14, 2025 -->
                </p>
            </div>

            <div class="text-center mb-8">
                <div class="text-3xl font-bold text-primary mb-2">
                    <i class="fas fa-leaf mr-2"></i>EvoDana
                </div>
                <h2 class="text-2xl font-semibold text-gray-800">Welcome Back</h2>
            </div>
            <form id="login-form" action="${pageContext.request.contextPath}/login" method="POST">
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-medium mb-2">Username</label>
                    <input type="text" id="login-username" name="username" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent" placeholder="Enter your username" required>
                </div>
                <div class="mb-6">
                    <label class="block text-gray-700 text-sm font-medium mb-2">Password</label>
                    <input type="password" id="login-password" name="password" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent" placeholder="Enter your password" required>
                </div>
                <div id="secret-key-field" class="mb-6 hidden">
                    <label class="block text-gray-700 text-sm font-medium mb-2">Secret Key (Admin Access)</label>
                    <input type="text" id="secret-key" name="secretKey" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent" placeholder="Enter secret key">
                </div>
                <c:if test="${not empty error}">
                    <div id="login-error" class="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded-lg">
                        ${error}
                    </div>
                </c:if>
                <button type="submit" class="w-full bg-primary text-white py-3 rounded-lg font-semibold hover:bg-accent transition-colors mb-4">
                    Login
                </button>
                <div class="text-center">
                    <a href="#" class="text-secondary hover:underline">Forgot Password?</a>
                </div>
            </form>
            <div class="mt-6 text-center">
                <span class="text-gray-600">Don't have an account? </span>
                <a href="${pageContext.request.contextPath}/register" class="text-secondary hover:underline font-medium">Register</a>
            </div>
            <div class="mt-4 text-center">
                <a href="${pageContext.request.contextPath}/home" class="text-gray-500 hover:text-gray-700">← Back to Home</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp" />

<script>
    // Hiển thị trường secret key nếu username là 'admin'
    document.getElementById('login-username').addEventListener('input', function() {
        const secretKeyField = document.getElementById('secret-key-field');
        if (this.value === 'admin') {
            secretKeyField.classList.remove('hidden');
        } else {
            secretKeyField.classList.add('hidden');
        }
    });
</script>