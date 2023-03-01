<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Eco_Score</title>
</head>
<body>
    <center> 
        <h1> Site de comparaison de Produit </h1> 
          <br/>
<a href="Default.aspx?page=0">Accueil</a>
<a href="Default.aspx?page=1">Gestion des clients</a>

<%
    int page = 0; 
    if (Request["page"] != null){
        page = int.Parse(Request["page"] );
    }else {
        page = 0; 
    }     
    switch (page){
    case 1 : %> <!-- #include file="produits.aspx" --> <% break; 
    }
%>
        
</center>
</body>
</html>