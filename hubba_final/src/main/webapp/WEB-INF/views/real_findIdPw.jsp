<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<head>
   <title>Find Id/Pw</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" 
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
   crossorigin="anonymous"/>
   <link rel="stylesheet" href="<c:url value="/resources/css/real_findIdPw.css"/>" type="text/css"/>  
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body style="font-family: 'MapoPeacefull';">

<div class="container-fluid" id="login_container">
   <!-- hubba hubba 로고 위치 -->
   <div class="row">
      <div class="col-3"></div>
      <div class="col-6" id="logo_col">
         <h1 id="title" onclick="location.href='${pageContext.request.contextPath}/main'" ><i>hubba<br/>hubba</i></h1>
      </div>
      <div class="col-3"></div>
   </div>

   <div class="row">
      <div class="col-3"></div>
      <div class="col-6">
      
         <div class="container" id="nav_tabs_container">

         <!-- Nav tabs -->
         <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
               <a class="nav-link active" data-toggle="tab" href="#find_Id">Id 찾기</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" data-toggle="tab" href="#find_Pw">Password 찾기</a>
            </li>
         </ul>
         
         
         <!-- Tab panes -->
      <div class="tab-content">
         <div id="find_Id" class="container tab-pane active"><br>
                <div class="container" >
                   <div class="row">
                      <div class="col-3"></div>
                      <div class="col-6">
                        <form action="findId" method="post">
                           <div class="form-group">
                              <input type="text" class="form-control" id="name" name="name" placeholder="name">
                           </div>
                           <div class="form-group">
                              <input type="email" class="form-control" id="email" name="email" placeholder="email">
                           </div>
                              <button type="submit" class="btn btn-outline-secondary btn-block" >Id 찾기</button>
                        </form>
                     </div> <!--  col,6 end -->
                     <div class="col-3"></div>
                  </div> <!-- row end -->
               </div> <!-- container end -->
           </div> <!-- #find_id end -->
           
         <div id="find_Pw" class="container tab-pane fade"><br>
            <div class="container">
               <div class="row">
                  <div class="col-3"></div>
                  <div class="col-6">
                     <form action="findPw" method="post">
                        <div class="form-group">
                           <input type="text" class="form-control" id="id" name="id" placeholder="id">
                        </div>
                        <div class="form-group">
                           <input type="text" class="form-control" id="name" name="name" placeholder="name">
                        </div>
                        <div class="form-group">
                           <input type="email" class="form-control" id="email" name="email" placeholder="email">
                        </div>
                     <button type="submit" class="btn btn-outline-secondary btn-block">Password 찾기</button>
                     </form>
                  </div> <!-- col,6 end -->
                  <div class="col-3"></div>
               </div> <!-- row end -->
            </div> <!-- container end -->
         </div> <!-- #find_Pw edn -->
             
      </div> <!-- .tabs content end  -->
         </div>
      </div>
      <div class="col-3"></div>
   </div>

</div>

 <!-- 푸터 -->
<div>
   <%@include file = "footer2.jsp" %>
</div>

</body>
</html>