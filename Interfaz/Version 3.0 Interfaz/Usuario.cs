using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUD
{
    public class Usuario
    {
        //Atributos de la clase usuario
        public int userId;
        public string userName;
        string password;
        string userIp;


        public Usuario(string pUserIp)
        {
            this.userIp = pUserIp;
        }

        public void setUserIp(string pUserIp)
        {
            this.userIp = pUserIp;
        }

        public void setUserId(int pUserId) 
        {
            this.userId = pUserId;
        }

        public void setUserName(string pUserName)
        {
            this.userName = pUserName;
        }

        public int getUserId() 
        {
            return this.userId;
        }

        public string getUserName()
        {
            return this.userName;
        }

        public string getUserIp()
        {
            return this.userIp;
        }
    }
}