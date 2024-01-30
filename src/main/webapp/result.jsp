<%@ page import="loto.vn.exercise0502.SkillBean" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="skillBean" class="loto.vn.exercise0502.SkillBean" scope="request">
</jsp:useBean>
<%@ page import="java.util.Locale" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>

<html lang="en">
<head>
    <title>Results</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/appStyle.css">
    <link href='https://fonts.googleapis.com/css?family=Be+Vietnam+Pro' rel='stylesheet'>

</head>
<body>
<!--todo balise jsp:useBean et mettre le nom du bean choisi dans le controller !-->
<!--todo afficher listes des competences apprises et pas apprises-->

<!-- Set locale for the entire page -->
<c:set var = "current" value="${param.lang}" scope="session"></c:set>
<c:if test="${not empty current}">
    <fmt:setLocale value="${current}" scope="session" />
</c:if>
<fmt:bundle basename="LaunchWeb">
    <center>

        <section class="container colorWhite">
            <h1 class="title"><fmt:message key="Hello">
                <fmt:param value="${skillBean.name}"/>
                </fmt:message></h1>

        <%--Method 2--%>
            <%--<h1>Hello <%=skillBean.getName()%></h1>--%>
            <div class="listSkillResult">
                <h2 class="label-left"> <fmt:message key="obtained-skill">
                    <fmt:param value="Your obtained Skill"/>
                </fmt:message></h2>
                <div class="obtainedListStyle">
                    <c:forEach var="skill" items="${skillBean.obtainingList}">
                        <li><fmt:message key="skill.${skill}"/></li>
                    </c:forEach>
                </div>
            <%--method 1
            <loto:obtainingList list="${skillBean.obtainingList}"/>
            --%>

            <%--Method 2
                <%--<% for (String element : skillBean.getObtainingList()) { %>
                  <li class="obtainedListStyle"><%= element%></li>
                <% } %>--%>
            </div>
            <div class="listSkillResult">
                <h2><fmt:message key="missing-skill">
                    <fmt:param value="Your missing Skills"/>
                </fmt:message></h2>
                <div class="missingListStyle">
                        <%--method 1
                        <loto:obtainingList list="${skillBean.missingList}"/>
                        --%>
                        <%--Method 2
                        <%-- <% for (String element : skillBean.getMissingList()) { %>
                         <li class="missingListStyle"><%= element%></li>
                         <% } %>--%>
                    <c:forEach var="skill" items="${skillBean.missingList}">
                        <li class="missingListStyle"><fmt:message key="skill.${skill}"/></li>
                    </c:forEach>
                    <br>
                </div>
            </div>

</section>
</center>
</fmt:bundle>
</body>
</html>
