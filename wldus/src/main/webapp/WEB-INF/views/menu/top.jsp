<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      	<A class='menu_link'  href='/' >HOME</A><span class='top_menu_sep'></span>
      	<A class='menu_link'  href='/event/event.do' >이벤트</A><span class='top_menu_sep'></span>
      	<!-- <A class='menu_link'  href='/notice/list.do'>공지사항</A><span class='top_menu_sep'></span> -->
      	<A class='menu_link'  href='#'>회원가입</A><span class='top_menu_sep'></span>
      	<c:choose>
        	<c:when test="${sessionScope.users_id == null}">
            	<a class="menu_link" href="/users/login.do">LOGIN</a>
            </c:when>
            <c:otherwise>
            <%-- <c:choose>
            	<c:when test="${sessionScope.users_grade < 10 }">
            		<i class="fa-solid fa-user-lock"></i>
            	</c:when>
            	<c:otherwise>
            		<i class="fa-solid fa-user"></i>
            	</c:otherwise>
            </c:choose> --%>
            	${sessionScope.users_name }님
               	<a class="menu_link" href='/users/logout.do'>LOGOUT</a>
               	<a class="menu_link" href='/users/remove.do'>회원 탈퇴</a>
            </c:otherwise>
        </c:choose>  
                    
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 
  <DIV class='content'>
  </DIV>