using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moldfollow
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet1TableAdapters.KT_ISLEMLERTableAdapter dt = new DataSet1TableAdapters.KT_ISLEMLERTableAdapter();
            Repeater1.DataSource = dt.islemlistesi();
            Repeater1.DataBind();
        }
    }
}