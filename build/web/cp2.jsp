<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 

<html>
<head>
    <title>Display data from the table using jsp</title>
</head>
<body>
      <%
                          String uname= (String) session.getAttribute("insti");
           %>
<h2 align="center">MODI-FIED :-) </h2>
<%
      try {
          Connection connection = null;
          Statement statement = null;
          ResultSet rs = null;
          ResultSet rs1=null;
        
         PreparedStatement st=null;
        PreparedStatement s=null;
        
          // Load JBBC driver "com.mysql.jdbc.Driver"
         Class.forName("com.mysql.jdbc.Driver");
            connection=  DriverManager.getConnection( "jdbc:mysql://localhost:3306/interview", "root", "roshini");
        statement = connection.createStatement();
        String b=request.getParameter("cpass");
        String c=request.getParameter("npass");

          // sql query to retrieve values from the secified table.
 
        String sql = "update login SET password= ? WHERE username= ? AND password= ?";
         st=connection.prepareStatement(sql);
        st.setString(1,c);
       st.setString(2,uname);
        st.setString(3,b);
              
        st.executeUpdate();
        st=null;
       
        
         String sql1 = "select username,password from login where username=? and password=?";
         st=connection.prepareStatement(sql1);
        st.setString(1,uname);
         st.setString(2,c);
     rs=st.executeQuery();
     
     %>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;" align="center">
        <TD>IID</TD>        
	<TD>PASSWORD</TD>
     
  <%
    while (rs.next()) {
    %>
    
    <TR>
        <TD><%=rs.getString(1)%></TD>
        <TD><%=rs.getString(2)%></TD>
        
         <%   }   
  
    rs.close();
    rs1.close();
    statement.close();
    connection.close();
      }catch (Exception ex) {
            }
        %>
    </TABLE><TABLE align="center">
        <TR>
            <TD><FORM ACTION="ehome.jsp" method="get" >
            <button type="submit"><-- back </button></TD>
        </TR>
    </TABLE>
</font>
</body>
</html>