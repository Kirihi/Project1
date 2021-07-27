<%@page import="procesosDb.ProcesosSeries"%>
<%
    try {
            Integer id = Integer.parseInt(request.getParameter("id"));
    
            ProcesosSeries procesosSeries = new ProcesosSeries();

            procesosSeries.EliminarSerie(id);
            
            response.sendRedirect("../../administracion.jsp");
        } catch (Exception e) {
        }
%>
