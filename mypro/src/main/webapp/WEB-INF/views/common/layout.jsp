<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
<style>
           @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Do+Hyeon&family=Jua&display=swap');
    #container {
        width: 100%;
        margin: 0px auto;
          text-align:center;
        border: 0px solid #bcbcbc;
    }   
    .round{
    border-radius: 25px;
    width: auto;
    margin: auto;}
.img {
  display: block;
  margin: 10px auto;
  max-width: 100%;
  height: auto;
}
.card-list {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
  padding: 20px;
  justify-items: center;
}
.card {
  width: 100%;
  max-width: 300px;
  height: auto;
  border: 1px solid #000;
  border-radius: 25px;
  text-align: center;
}
 #main {
  width: 100%;
  max-width: 1200px;
  margin: 10px auto;
  padding: 0 15px; /* 좌우 여백 추가 */
} 
    #table-container{
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    margin:auto
                }
    .text-align{
        text-align: center;
    }
   .html{
      font-family: 'Jua', cursive;
/*       text-align: center; */
    }
    .colored{
        background-color: #fae18f;
    }
@media (max-width: 768px) {
  h2 {
    font-size: 1.5em;
  }
}
    
  </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <%-- <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
      </div> --%>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>