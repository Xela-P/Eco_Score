
using Eco_Score;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Eco_Score
{
    public class Controleur
    {
        private static Modele unModele = new Modele("localhost", "EcoScore", "root", "");

        public static void InsertClient(Client unClient)
        {
            unModele.InsertClient(unClient);
        }

        public static void UpdateClient(Client unClient)
        {
            unModele.UpdateClient(unClient);
        }

        public static Client SelectWhereClient(int idClient)
        {
            return unModele.SelectWhereClient(idClient);
        }
        public static List<Client> SelectAllClient()
        {
            return unModele.SelectAllClient();
        }
        public static string SelectAlllike(string idClient)
        {
            return unModele.SelectAlllike(idClient);
        }

    }
}