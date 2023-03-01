


<h2>Liste des Produits</h2>

<table>
    <table id="myTab">
  <tr>
    <th>Vendeur</th>
    <th>Produit</th>
    <th>Image</th>
    <th>Prix</th>
    <th>Like</th>
  </tr>
    <%
    string chaine ="";
    foreach (Produit unProduit in lesProduits){
        chaine += "<tr>";
        chaine +="<td>"+unproduit.Vendeur+"</td>";
        chaine +="<td>"+unProduit.Nom+"</td>";
        chaine +="<td> </td>";
        chaine +="<td>"+unProduit.Image+"</td>";
        chaine +="<td>"+unProduit.Prix+"</td>";
        chaine +="<td> <input type="checkbox" id="coeur2" name="coeur2" value="coeur2" onclick="jeLike(unProduit)">
            <label for="coeur2"></label></td>";
        chaine +="</tr>";
    }
    chaine +="</table>"

<%= chaine %>