<%
	Set reg = New RegExp
	reg.Pattern = "^[A-Za-z0-9\._\-]+@([A-Za-z0-9\._\-]+\.)+[A-Za-z0-9\._\-]+$"
	Set m = reg.Execute(Request.QueryString("your_email"))
	
	if m.count > 0 then
		smtpServer = "swapper.loc"
		smtpPort = 25

		name = Request.QueryString("your_name")
		Set myMail = CreateObject("CDO.Message") 
		myMail.Subject = "from " & name
		myMail.From = Request.QueryString("your_email")
		myMail.To = Request.QueryString("recipient")
		myMail.HTMLBody = "<html><head><title>Contact letter</title></head><body><br>" & Request.QueryString("message") & "</body></html>"
		myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
		myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = smtpServer
		myMail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = smtpPort
		myMail.Configuration.Fields.Update 
		myMail.Send
		Response.Write("Your email was sent")
	else
		Response.Write("Invalid email")
	End if
	
%>
<script>
	resizeTo(300, 300)
	//window.close()
</script>