using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace TestConsole
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string m_str_Server = @".\LAPTOP-MJK5DKVT"
                , m_str_Database = "quanlysanbong"
                , m_str_User = "sa"
                , m_str_Password = "24112002minh";
            SQLConnection.SetConnectionInfo(m_str_Server, m_str_Database, m_str_User, m_str_Password);
            if (SQLConnection.TestConnection())
            {
                Console.WriteLine("ok");
            }
            else
            {
                Console.WriteLine("fail");
            }    
        }
    }
}


