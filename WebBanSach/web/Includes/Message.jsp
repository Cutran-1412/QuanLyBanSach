<%-- 
    Document   : header
    Created on : Nov 15, 2025, 5:26:46?PM
    Author     : Osiris
--%>

<%
    String globalMsg   = (String) session.getAttribute("globalMsg");
    String globalBg    = (String) session.getAttribute("globalBg");       // màu n?n
    String globalColor = (String) session.getAttribute("globalColor");    // màu ch?
    String globalBorder = (String) session.getAttribute("globalBorder");  // màu vi?n
%>

<% if (globalMsg != null) { %>
    <div class="global-alert"
         style="
            background:<%= globalBg != null ? globalBg : "#f0f0f0" %>;
            color:<%= globalColor != null ? globalColor : "#000" %>;
            border:1px solid <%= globalBorder != null ? globalBorder : "#ccc" %>;
         ">
        <div class="global-alert-text"><%= globalMsg %></div>
    </div>

    <script>
        setTimeout(() => {
            document.querySelector(".global-alert").classList.add("show");
        }, 50);

        setTimeout(() => {
            const alert = document.querySelector(".global-alert");
            if (alert) alert.classList.remove("show");
        }, 3000);
    </script>

<%
    session.removeAttribute("globalMsg");
    session.removeAttribute("globalBg");
    session.removeAttribute("globalColor");
    session.removeAttribute("globalBorder");
} %>

<style>
.global-alert {
    position: fixed;
    top: -60px;
    left: 50%;
    transform: translateX(-50%);
    width: 350px;
    padding: 12px 18px;
    border-radius: 6px;
    font-size: 16px;
    font-weight: 500;
    text-align: center;
    z-index: 9999;
    transition: top 0.4s ease;
    box-shadow: 0 4px 10px rgba(0,0,0,0.15);
}
.global-alert.show {
    top: 15px;
}
</style>
