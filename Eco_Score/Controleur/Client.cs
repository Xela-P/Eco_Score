using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Eco_Score
{
    public class Client
    {
        private int idClient;
        private string nom, prenom, adresse, email, mdp;
        private List<Produit> mesProduits;
        public Client()
        {
            this.idClient = 0;
            this.nom = "";
            this.prenom = "";
            this.adresse = "";
            this.email = "";
            this.mdp = "";
            this.mesProduits = new List<Produit>();
        }

        public Client(int idClient, string nom, string prenom, string email, string mdp, string adresse)
        {
            this.idClient = idClient;
            this.nom = nom;
            this.prenom = prenom;
            this.adresse = adresse;
            this.email = email;
            this.mdp = mdp;
            this.mesProduits = new List<Produit>();
        }

        public Client(int idClient, string nom, string prenom, string email, string adresse)
        {
            this.idClient = 0;
            this.nom = nom;
            this.prenom = prenom;
            this.adresse = adresse;
            this.email = email;
            this.mdp = mdp;
            this.mesProduits = new List<Produit>();
        }




        public Client(string nom, string prenom, string email, string mdp, string adresse)
        {
            this.nom = nom;
            this.prenom = prenom;
            this.adresse = adresse;
            this.email = email;
            this.mdp = mdp;
        }

        public string Adresse
        {
            get => adresse; set => adresse = value;
        }
        public int IdClient
        {
            get => idClient; set => idClient = value;
        }
        public string Nom
        {
            get => nom; set => nom = value;
        }
        public string Prenom
        {
            get => prenom; set => prenom = value;
        }
        public string Email
        {
            get => email; set => email = value;
        }
        public string Mdp
        {
            get => mdp; set => mdp = value;
        }
        public List<Produit> MesProduits
        {
            get => mesProduits; set => mesProduits = value;
        }
    }
}