using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for AppSetting
/// </summary>
public class AppSetting
{
	public AppSetting()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string ConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["conDB"].ConnectionString;
    }

}