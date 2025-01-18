using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moldfollow
{
    public partial class formduraklamalar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet1TableAdapters.islemduraklatTableAdapter hi = new DataSet1TableAdapters.islemduraklatTableAdapter();
            Repeater1.DataSource = hi.Getislemdurak();
            Repeater1.DataBind();


        }
    }
}