<%-- 
    Document   : header
    Created on : Nov 15, 2025, 5:26:46?PM
    Author     : Osiris
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty sessionScope.globalMessage}">
    <div class="alert alert-${sessionScope.globalMessageType} alert-dismissible fade show" role="alert">
        ${sessionScope.globalMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <c:remove var="globalMessage" scope="session"/>
    <c:remove var="globalMessageType" scope="session"/>
</c:if>

