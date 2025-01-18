using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moldfollow
{
    public partial class formtakipbekleme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet1TableAdapters.UR_KALIPARIZATableAdapter ut = new DataSet1TableAdapters.UR_KALIPARIZATableAdapter();
            Repeater1.DataSource = ut.bekleyenarizadata();
            Repeater1.DataBind();
        }
    }
}