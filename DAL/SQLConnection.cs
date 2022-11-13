using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class SQLConnection
    {
        private static string m_str_Server,m_str_Database,m_str_User,m_str_Password ;

        public static string ConnectionString = string.Empty;

        public static void SetConnectionInfo(string str_Server, string str_Database, string str_User, string str_Password)
        {
            m_str_Server = str_Server;
            m_str_Database = str_Database;
            m_str_User = str_User;
            m_str_Password = str_Password;
            SetConnectionString();
        }

        private static void SetConnectionString()
        {
            string connectionTemplate = @"Server=myServerName\myInstanceName;Database=myDataBase;User Id=myUsername;Password=myPassword;";
            ConnectionString = string.Format(connectionTemplate, m_str_Server, m_str_Database, m_str_User, m_str_Password);
            //string.Format replay arg phía trên
        }
        public static bool TestConnection()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                    {
                        connection.Open();
                        connection.Close();
                        return true;
                    }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
