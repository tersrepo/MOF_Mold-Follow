using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moldfollow
{
    public partial class formtakiptamamview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet1TableAdapters.UR_KALIPARIZATableAdapter ut = new DataSet1TableAdapters.UR_KALIPARIZATableAdapter();
            Repeater2.DataSource = ut.gettamamlanantakip();
            Repeater2.DataBind();
        }
    }
}