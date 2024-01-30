<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<jsp:useBean id="skillBean" class="loto.vn.exercise0502.SkillBean" scope="request">
<jsp:setProperty name="skillBean" property="*"/>
</jsp:useBean>

<!DOCTYPE html>
<!-- Set locale for the entire page -->
<c:set var = "current" value="${param.lang}" scope="session"></c:set>
<c:if test="${not empty current}">
    <fmt:setLocale value="${current}" scope="session" />
</c:if>
<fmt:bundle basename="LaunchWeb">
<html>
<head>
    <title>JSP - Exercise 05</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/appStyle.css">
    <link href='https://fonts.googleapis.com/css?family=Be+Vietnam+Pro' rel='stylesheet'>

</head>
<body>
<center>

    <section class="container colorWhite">
        <form action="index.jsp" method="post" class="formLanguage">
            <label for="langSelect">
                <fmt:message key = "select-language"/>:
            </label>
            <select name="lang" id="langSelect" onchange="changeLanguage()">
                <option value="en_US">English</option>
                <option value="fr_FR">French</option>
                <option value="vi_VN">Việt Nam</option>
            </select>
            <br>
            <input type="submit" value="<fmt:message key="button"/>">
        </form>
        <h1 class="title">
            <fmt:message key = "welcome">
            </fmt:message>
        </h1>
        <form action="controllerServlet" method="get" >

            <h2 class="">
                <fmt:message key ="enterName"></fmt:message>
                </h2>

            <tr>
                <td>
                    <input class="nameInput colorBlack" type="text" id="name" name="name" required placeholder="<fmt:message key="enterName"/>"
                           value="<jsp:getProperty name="skillBean" property="name"/>"/>
                </td>
            </tr>

            <h2><fmt:message key="enterSkill"></fmt:message></h2>

            <section class="listSkillStyle">
               <%--method 1
                        <loto:CheckBox list="${skillBean.list}" name="checkedSkill"/>
                  --%>

                   <c:forEach var="skill" items="${skillBean.list}">
                       <label class="label-left"><fmt:message key="skill.${skill}"/></label>
                       <input class="input-right" type="checkbox" name="checkedSkill" value="${skill}">
                   <br>
                   </c:forEach>

               <%-- method 3
               <% List<String> listSkill = skillBean.list; %>--%>
                <%--<% for (String skill : listSkill){ %>--%>
                <%--<input type="checkbox" name="checkedSkill" value="<%=skill%>" >--%>
                <%--<%= skill%>--%>
                <%--</br>--%>
                <%--<% } %>
                --%>
            </section>
            <br>

            <button type="submit" class="submitBtn"><fmt:message key="button"/></button>
        </form>
    </section>
</center>
</body>
</html>
</fmt:bundle>