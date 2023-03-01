using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Eco_Score
{
    public class Produit
    {

        protected int idProduit;
        protected string vendeur, nom, image, prix, type, composition, couleur, date_ajout;
        public Produit()
        {
            this.idProduit = 0;
            this.vendeur = "";
            this.nom = "";
            this.image = "";
            this.prix = "";
            this.composition = "";
            this.type = "";
            this.couleur = "";
            this.date_ajout = "";
        }

        public Produit(int idProduit, string vendeur, string nom, string image, string prix, string composition, string type, string couleur, string date_ajout)
        {
            this.idProduit = idProduit;
            this.vendeur = vendeur;
            this.nom = nom;
            this.image = image;
            this.prix = prix;
            this.composition = composition;
            this.type = type;
            this.couleur = couleur;
            this.date_ajout = date_ajout;
        }

        public Produit(string nom, string composition, string type, string couleur)
        {

            this.nom = nom;
            this.composition = composition;
            this.type = type;
            this.couleur = couleur;
        }

        public int IdProduit
        {
            get => idProduit; set => idProduit = value;
        }


        public string Nom
        {
            get => nom; set => nom = value;
        }


        public string Composition
        {
            get => composition; set => composition = value;
        }


        public string Type
        {
            get => type; set => type = value;
        }


        public string Couleur
        {
            get => couleur; set => couleur = value;
        }

    }
}