using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace MApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static string GetJson(string ids, string tipo)
        {
            return JsonConvert.SerializeObject(GetTextMap(ids, tipo));
        }

        public static Dictionary<string, string> GetTextMap(string ids, string tipo)
        {
            //var mc = new MetodosComunes();
            var claves = ids.Split(',');
            var map = new Dictionary<string, string>();

            if (tipo == "titulo")
            {
                foreach (var clave in claves)
                    map[clave] = $"title-{clave}-ssx"; //mc.ObtenerTituloPorClave(int.Parse(clave));
            }
            else
            {
                foreach (var clave in claves)
                    map[clave] = $"error-{clave}-ssx"; //mc.ObtenerMensajeErrorPorClave(int.Parse(clave));
            }


            return map;
        }
    }
}