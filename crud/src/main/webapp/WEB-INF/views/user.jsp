<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<meta charset="utf-8">
<head>
    <title>User Page</title>
    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
        /*.tg .tg-4eph{background-color:#f9f9f9}*/
    </style>
</head>

<body>


<table width="100%">
    <tr>
    <th>
        <h3 align="center">Users List</h3>
        <c:if test="${empty listUsers.pageList}">
            <table align="center" style="margin-left: 7em">
                <tr>
                    <td>
                        <h2 style="background-color: crimson">Sorry, no one User found...</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2><a href="/users/">Back to first page</a></h2>
                    </td>
                </tr>
            </table>
        </c:if>
        <c:if test="${!empty listUsers.pageList}">
            <table class="tg" align="center" style="margin-left: 7em">
                <tr>
                    <th width="80">User ID</th>
                    <th width="120">User Name</th>
                    <th width="120">User Age</th>
                    <th width="120">Admin flag</th>
                    <th width="120">Registration date</th>
                    <th width="60">Edit</th>
                    <th width="60">Delete</th>
                </tr>
                <c:forEach items="${listUsers.pageList}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td align="center">${user.age}</td>
                        <td>${user.admin}</td>
                        <td>${user.createdDate}</td>
                        <td><a href="<c:url value='/edit/${listUsers.page}p${user.id}' />" >Edit</a></td>
                        <td><a href="<c:url value='/remove/${user.id}' />" >Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <br>
        <c:if test="${listUsers.pageCount>1}">
            <table class="tg" align="center">
                <c:set var="pages"  value="${1}"/>
                <c:set var="lastPage"  value="${listUsers.pageCount+1}"/>
                <tr>
                    <th><a href="<c:url value='/page/first' />" >First</a></th>
                    <th><a href="<c:url value='/page/p${listUsers.page}' />" >Prev.</a></th>

                    <th style="background-color: coral">${listUsers.page+1} of ${listUsers.pageCount}</th>

                    <th><a href="<c:url value='/page/n${listUsers.page}' />" >Next</a></th>
                    <th><a href="<c:url value='/page/last' />" >Last</a></th>
                    <th></th><th></th>
                    <th style="background-color: coral"><p>View ${listUsers.firstElementOnPage+1} - ${listUsers.lastElementOnPage+1} of ${listUsers.nrOfElements}</p></th>
                </tr>
            </table>
        </c:if></th>
    <td width="250">

            <table align="left">
                <tr>
                    <td>
                        <h1>
                            Add a User
                        </h1>
                    </td>
                </tr>
                <tr>
                    <td>

                        <c:url var="addAction" value="/user/add" />

                        <form:form action="${addAction}" commandName="user" >
                        <form:label path="id" >
                            <spring:message text="ID" />
                        </form:label>
                        <form:input path="id" />
                    </td>
                </tr>
                <tr>
                    <td width="200">
                        <form:label path="name" >
                            <spring:message text="Name" />
                        </form:label>
                        <form:input path="name" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="age">
                            <spring:message text="Age "/>
                        </form:label>
                        <form:input path="age" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="admin">
                            <spring:message text="Admin "/>
                        </form:label>
                        <form:radiobutton path="admin" value="true" />
                        <form:radiobutton path="admin" value="false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" >
                        <c:if test="${!empty user.name}">
                            <input type="submit"
                                   value="<spring:message text="Edit User"/>" />
                        </c:if>
                        <c:if test="${empty user.name}">
                            <input type="submit"
                                   value="<spring:message text="Add User"/>" />
                        </c:if>
                        </form:form>
                    </td>
                </tr>
                <tr>
                    <td height="70"></td>
                </tr>
                <tr>
                    <td>
                        <h1>
                            Find a User by name
                        </h1>
                        <c:url var="searchAction" value="/user/search/" />
                        <form:form action="${searchAction}" commandName="user" >
                        <form:label path="name">
                            <spring:message text="Search"/>
                        </form:label>
                        <form:input path="name"/>
                        <input type="submit"
                               value="<spring:message text="Go!"/>"  />
                    </td>
                </tr>
            </table>
                        </form:form>
        </td>
    </tr>
</table>
</body>
</html>