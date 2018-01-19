using System;
using System.Collections.Generic;
using System.IO;
using System.Collections;
using System.Web.Mvc;
using System.Linq;

namespace Pruefung_Praktisch_Musterloesung.Controllers
{
    public class Lab1Controller : Controller
    {
        /**
         * 
         * Aufgabe 1
         * 
         * 1. 
         * Man hat die Möglichkeit in die Filepfade einzusehen, wenn man diese Pfade abändert kann man auf Bilder zugreifen
         * auf welche man möglicherweise keine Zugriff hätte.
         * Möglicherweise kann man dadurch ein eigenes "File/Script" verlinken, welche nicht auf dem Server liegt. Dadurch gibt es 
         * eine Sicherheitslücke.
         * File Inclusion
         * Directory Traversal
         * 2. 
         * http://localhost:50374/Lab1/index?type=bears
         * http://localhost:50374/Lab1/Detail?file=bear1.jpg&type=bears
         * 
         * 3. 
         * Da hier eine einfache Url Abfrage stattfindet, kann hier durch die Änderungen des URLs auf Daten gelangen werden,
         * welche ansonsten nicht möglich wäre. Hier kann ich auf die Bilder von Bären zugreifen und auch auf die einzelnen Bilder
         * des Types.
         * 
         * Da die Abfrage nur den Type abfragt kann dies mit bears abgeändert werden.
         * Bei der Detail-Ansicht muss die file ergänzt werden(bear1.jpg) und type als bears.
         * 
         * 4.
         * */


        public ActionResult Index()
        {
            var type = Request.QueryString["type"];

            if (string.IsNullOrEmpty(type))
            {
                type = "lions";                
            }

            var path = "~/Content/images/" + type;

            List<List<string>> fileUriList = new List<List<string>>();

            if (Directory.Exists(Server.MapPath(path)))
            {
                var scheme = Request.Url.Scheme; 
                var host = Request.Url.Host; 
                var port = Request.Url.Port;
                
                string[] fileEntries = Directory.GetFiles(Server.MapPath(path));
                foreach (var filepath in fileEntries)
                {
                    var filename = Path.GetFileName(filepath);
                    var imageuri = scheme + "://" + host + ":" + port + path.Replace("~", "") + "/" + filename;

                    var urilistelement = new List<string>();
                    urilistelement.Add(filename);
                    urilistelement.Add(imageuri);
                    urilistelement.Add(type);

                    fileUriList.Add(urilistelement);
                }
            }
            
            return View(fileUriList);
        }

        public ActionResult Detail()
        {
            var file = Request.QueryString["file"];
            var type = Request.QueryString["type"];

            if (string.IsNullOrEmpty(file))
            {
                file = "Lion1.jpg";
            }
            if (string.IsNullOrEmpty(type))
            {
                file = "lions";
            }

            var relpath = "~/Content/images/" + type + "/" + file;

            List<List<string>> fileUriItem = new List<List<string>>();
            var path = Server.MapPath(relpath);

            if (System.IO.File.Exists(path))
            {
                var scheme = Request.Url.Scheme;
                var host = Request.Url.Host;
                var port = Request.Url.Port;
                var absolutepath = Request.Url.AbsolutePath;

                var filename = Path.GetFileName(file);
                var imageuri = scheme + "://" + host + ":" + port + "/Content/images/" + type + "/" + filename;

                var urilistelement = new List<string>();
                urilistelement.Add(filename);
                urilistelement.Add(imageuri);
                urilistelement.Add(type);

                fileUriItem.Add(urilistelement);
            }
            
            return View(fileUriItem);
        }
    }
}