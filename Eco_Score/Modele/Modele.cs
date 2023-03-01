using System;
using System.Collections.Generic;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Diagnostics;
using System.Reflection;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Reflection.PortableExecutable;


namespace Eco_Score
{
    public class Modele
    {
        private string serveur, bdd, user, mdp;
        private MySqlConnection maConnexion;
        public Modele(string serveur, string bdd, string user, string mdp)
        {
            this.serveur = serveur;
            this.bdd = bdd;
            this.user = user;
            this.mdp = mdp;
            string url = "SslMode=None; SERVER=" + this.serveur + "; Database=" + this.bdd + "; User Id =" + this.user + "; Password=" + this.mdp;

            try
            {
                this.maConnexion = new MySqlConnection(url);
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de connexion a : " + url);
            }

        }

        public void InsertClient(Client unClient)
        {
            string requete = "call insertClient(@nom,@prenom,@email, @mdp, @adresse);";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables Mysql et C#
                uneCmde.Parameters.AddWithValue("@nom", unClient.Nom);
                uneCmde.Parameters.AddWithValue("@prenom", unClient.Prenom);
                uneCmde.Parameters.AddWithValue("@email", unClient.Email);
                uneCmde.Parameters.AddWithValue("@mdp", unClient.Mdp);
                uneCmde.Parameters.AddWithValue("@adresse", unClient.Adresse);
                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
        }



        public void DeleteProduit_like(int idLike)
        {
            string requete = "delete from Produit_Like where idLike = @idLike && idclient = @idclient;";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                uneCmde.Parameters.AddWithValue("@idlike", idLike);
                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }

        }
        public void UpdateClient(Client unClient)
        {
            string requete = "call updateClient(@idpers, @nom, @prenom, @email, @adresse);";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@idpers", unClient.IdClient);
                uneCmde.Parameters.AddWithValue("@nom", unClient.Nom);
                uneCmde.Parameters.AddWithValue("@prenom", unClient.Prenom);
                uneCmde.Parameters.AddWithValue("@email", unClient.Email);
                uneCmde.Parameters.AddWithValue("@adresse", unClient.Adresse);
                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
        }

        public List<Client> SelectAllClient()
        {
            string requete = "select * from vueClients ;";
            List<Client> lesClients = new List<Client>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de résultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Client unClient = new Client(
                                unReader.GetInt16(0),
                                unReader.GetString(1),
                                unReader.GetString(2),
                                unReader.GetString(3),
                                unReader.GetString(4),
                                unReader.GetString(5)
                                );
                            //ajouter dans la liste
                            lesClients.Add(unClient);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesClients;
        }



        public Client SelectWhereClient(int idClient)
        {
            string requete = "select * from vueClients where idpers = @idclient;";
            Client unClient = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@idclient", idClient);

                //creation d'un cruseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client

                            unClient = new Client(
                            unReader.GetInt32(0),
                            unReader.GetString(1),
                            unReader.GetString(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return unClient;

        }

        public string SelectAlllike(string idClient)
        {
            string requete = "select * from test_a_sup where id_em=@id_employe;";
            List<string> lesIds = new List<string>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@idClient", idClient);
                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {

                           lesIds.Add(unReader.GetString(4));

                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete : " + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            string id_chaine = string.Join(";", lesIds);


        }
    }
}