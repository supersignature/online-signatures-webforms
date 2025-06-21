<%@ Page Title="" Language="C#" MasterPageFile="~/Samples.Master" AutoEventWireup="true" CodeBehind="SaveDB.aspx.cs" Inherits="Online.Signatures.Webforms.SaveDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="server">
     <script src="https://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>

    <strong>CREATE TABLE SQL SCRIPT<br />
<br />
</strong>CREATE TABLE [dbo].[ImageTable]( [ticketId] [varchar](50) NOT NULL, 
[imageData] [image] NULL, CONSTRAINT [PK_ImageTable] PRIMARY KEY CLUSTERED ( 
[ticketId] ASC )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]<br /><br />

=================================================================================================================<br />
<br />
<strong>INSERT SIGNATURE TO DB</strong><br /><br />

            Bitmap bmp = ctlSignature.SaveSignature("");<br />
            byte[] imageData;<br />
            using (System.IO.MemoryStream stream = new System.IO.MemoryStream())<br />
            {<br />
                &nbsp;&nbsp;&nbsp;
                bmp.Save(stream, System.Drawing.Imaging.ImageFormat.Png); // you can use format of your choice.<br />
                &nbsp;&nbsp;&nbsp;
                stream.Position = 0;<br />
                &nbsp;&nbsp;&nbsp;
                imageData = new byte[stream.Length];<br />
                &nbsp;&nbsp;&nbsp;
                stream.Read(imageData, 0, imageData.Length);<br />
                &nbsp;&nbsp;&nbsp;
                stream.Close();<br />
            }<br />
            <br />
            SqlConnection con = new SqlConnection();<br />
            con.ConnectionString = @"Data Source=YOUR_SERVER;User ID=sa;Password=sa;Initial Catalog=YOUR_DATABASE"; //provide connection string of your server.<br />
            con.Open(); //open connection to server.<br />
            string query = "insert into ImageTable values (@ticketId, @imageData)"; //create a query variable.<br />


            SqlCommand cmd = new SqlCommand(query, con); //create a sqlcommand object.<br />
            cmd.Parameters.Add(new SqlParameter("@ticketId", Request.QueryString["ticketId"])); //add first parameter ticket id.<br />
            cmd.Parameters.Add(new SqlParameter("@imageData", imageData)); //add second parameter image bytes.<br />
            <br /><br />

            int rows = cmd.ExecuteNonQuery(); //execute query.<br /><br />

            if (rows > 0)<br />
            {<br />
                &nbsp;&nbsp;&nbsp; // OK<br />
            }<br />
            else<br />
            {<br />
                &nbsp;&nbsp; // ERROR<br />
            }<br />
            <br />
            con.Close();<br />


=================================================================================================================<br />
<br /><strong>LOAD BACK FROM DB<br />
<br />
	    </strong>if (null != Request.QueryString["ticketId"])<br />
            {<br />
                 &nbsp;&nbsp;&nbsp;
                 string ticketId = Convert.ToString(Request.QueryString["ticketId"]);<br /><br />

                 &nbsp;&nbsp;&nbsp;

                 SqlConnection con = new SqlConnection();<br />
                 &nbsp;&nbsp;&nbsp;
                 con.ConnectionString = @"Data Source=YOUR_SERVER;User ID=sa;Password=sa;Initial Catalog=YOUR_DATABASE"; //provide connection string of your server.<br />
                 &nbsp;&nbsp;&nbsp;
                 con.Open(); //open connection to server.<br />
                 &nbsp;&nbsp;&nbsp;
                 SqlCommand cmdSelect = new SqlCommand("select imageData from ImageTable where ticketId=@ticketId", con);<br />

                 &nbsp;&nbsp;&nbsp;

                 cmdSelect.Parameters.Add("@ticketId",SqlDbType.VarChar,50);<br />
                 &nbsp;&nbsp;&nbsp;
                 cmdSelect.Parameters["@ticketId"].Value = ticketId;<br />

                 &nbsp;&nbsp;&nbsp;

                 byte[] imageData = (byte[])cmdSelect.ExecuteScalar();<br />
                 &nbsp;&nbsp;&nbsp;
                 MemoryStream ms = new MemoryStream(imageData);<br />
                 <br /><br />
                 &nbsp;&nbsp;&nbsp;
                 Response.ContentType = "image/png";<br />
                 &nbsp;&nbsp;&nbsp;
                 ms.WriteTo(Response.OutputStream);<br />
                 &nbsp;&nbsp;&nbsp;
                 Response.End();<br />
            <strong>}<br />

            <br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphFooter" runat="server">
    <script>

        $(document).ready(function () {

            setTimeout(function () {
                $("#divLeft").hide();
            }, 500);

        });

    </script>
</asp:Content>
