<% import Namespace="Eco_Score" %>
<% import Namespace="System.Collection.Generic" %>

<!-- #include file="Css/Main_Stylesheet.aspx"-->

<h1>Produits</h1>


<!-- #include file="Vue/Vue_les_produits.aspx"-->


<a href="SiteComparaisonLike.html">
    <button type="button">Voir les favoris</button>

    
</body>
</html>

<script>

    function jeLike(n)
    {
        let line = n+1;
        var table = document.getElementById("myTab");
        let Produit = table.rows[n].cells[1].innerHTML;
        let Vendeur = table.rows[n].cells[0].innerHTML;
        let Prix = table.rows[n].cells[3].innerHTML;
        let valeur = Vendeur + "||" + Produit + "||" + Prix;
        let cle = "favori";
        alert(valeur);
        stockerCookie(cle, valeur, 1);
        alert(lireCookie("favori"));
        
    }
    
    function stockerCookie(cle, valeur, delai)
            {
                //rajouter une sécurité avec un if cle vide...
    
                let chaine = "";
    
                //récupérer la date système
                let uneDate = new Date ();
    
                //on va lui ajouter un délai
                uneDate.setTime (uneDate.getTime() + delai * 24 * 3600 * 1000)
    
                //on va la transformer en chaîne
                let dt = uneDate.toUTCString();
    
                //on concatene le tout : cle = valeur; expires = dt; path=/
                chaine = cle + "=" + valeur + "; expires=" + dt +"; path=/";
                
                document.cookie = chaine;
            }
    
    function lireCookie(cle)
            {
                //on récupère la chaine cookie
                let chaineCookies = document.cookie ;
    
                //on split la chaine par ;
                let tab = chaineCookies.split(";");
    
                //on parcourt le tableau résultat du split
                for (let i = 0; i< tab.length ; i++) {
    
                    //on split par egal
                    let tab2 = tab[i].split("=");
                    while(tab2[0].charAt(0) == ' ') { tab2[0] = tab2[0].substring(1); }
    
                    //on compare une clé
                    if (tab2[0] == cle){
    
                        //on récupère la valeur de la clé
                        let valeur = tab2[1];
    
                        //on retourne la valeur associée à la clé
                        return valeur;
                    }
                }
                return null;
            }
    
</script>
    