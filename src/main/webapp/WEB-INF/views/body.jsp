<!-- WEB-INF/views/body.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body class="bg-gray-50">
    <!-- Navigation -->
    <nav class="bg-white shadow-lg fixed w-full top-0 z-50" id="nav">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
                <div class="flex items-center">
                    <div class="text-2xl font-bold text-primary">
                        <i class="fas fa-leaf mr-2"></i>EvoDana
                    </div>
                </div>
                <div class="hidden md:flex space-x-8" id="nav-links"></div>
                <div class="flex items-center space-x-4" id="auth-links">
                    <c:if test="${empty sessionScope.currentUser}">
                        <a href="${pageContext.request.contextPath}/login" class="text-primary hover:text-accent transition-colors">Login</a>
                        <a href="${pageContext.request.contextPath}/register" class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-accent transition-colors">Sign Up</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.currentUser}">
                        <a href="${pageContext.request.contextPath}/logout" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-colors">Logout</a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
    

    <!-- Nội dung chính sẽ được include ở đây qua các trang cụ thể -->
    
    <%--<c:if test="${not empty param.page}">
        <jsp:include page="/WEB-INF/views/${param.page}.jsp" />
    </c:if>
    <c:if test="${empty param.page}">
        <jsp:include page="/WEB-INF/views/index.jsp" /> 
    </c:if>--%>

    <script>
        function updateNavigation() {
            const navLinks = document.getElementById('nav-links');
            const authLinks = document.getElementById('auth-links');
            navLinks.innerHTML = '';
            authLinks.innerHTML = '';

            <c:if test="${not empty sessionScope.currentUser}">
                <c:choose>
                    <c:when test="${sessionScope.currentUser.role == 'customer'}">
                        navLinks.innerHTML = `
                            <a href="${pageContext.request.contextPath}/home?page=home-page" class="nav-link text-gray-700 hover:text-primary transition-colors">Home</a>
                            <a href="${pageContext.request.contextPath}/vehicles?page=vehicles" class="nav-link text-gray-700 hover:text-primary transition-colors">Vehicles</a>
                            <a href="${pageContext.request.contextPath}/dashboard?page=dashboard" class="nav-link text-gray-700 hover:text-primary transition-colors">Dashboard</a>
                        `;
                    </c:when>
                    <c:when test="${sessionScope.currentUser.role == 'staff'}">
                        navLinks.innerHTML = `
                            <a href="${pageContext.request.contextPath}/home?page=home-page" class="nav-link text-gray-700 hover:text-primary transition-colors">Home</a>
                            <a href="${pageContext.request.contextPath}/staff?page=staff" class="nav-link text-gray-700 hover:text-primary transition-colors">Staff Panel</a>
                        `;
                    </c:when>
                    <c:when test="${sessionScope.currentUser.role == 'admin'}">
                        navLinks.innerHTML = `
                            <a href="${pageContext.request.contextPath}/home?page=home-page" class="nav-link text-gray-700 hover:text-primary transition-colors">Home</a>
                            <a href="${pageContext.request.contextPath}/admin?page=admin" class="nav-link text-gray-700 hover:text-primary transition-colors">Admin Portal</a>
                        `;
                    </c:when>
                </c:choose>
                authLinks.innerHTML = `
                    <a href="${pageContext.request.contextPath}/logout" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-colors">Logout</a>
                `;
            </c:if>
            <c:if test="${empty sessionScope.currentUser}">
                navLinks.innerHTML = `
                    <a href="${pageContext.request.contextPath}/home?page=home-page" class="nav-link text-gray-700 hover:text-primary transition-colors">Home</a>
                    <a href="${pageContext.request.contextPath}/vehicles?page=vehicles" class="nav-link text-gray-700 hover:text-primary transition-colors">Vehicles</a>
                `;
                authLinks.innerHTML = `
                    <a href="${pageContext.request.contextPath}/login" class="text-primary hover:text-accent transition-colors">Login</a>
                    <a href="${pageContext.request.contextPath}/register" class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-accent transition-colors">Sign Up</a>
                `;
            </c:if>
        }

        // Gọi hàm khi trang được tải
        document.addEventListener('DOMContentLoaded', updateNavigation);
    </script>
</body>