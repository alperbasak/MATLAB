% % Define these variables appropriately:
% mail = mail'; %Your GMail email address
% password = pass;  %Your GMail password
% setpref('Internet','SMTP_Server','smtp.mail.yahoo.com');
% setpref('Internet','E_mail',mail);
% setpref('Internet','SMTP_Username',mail);
% setpref('Internet','SMTP_Password',password);
% props = java.lang.System.getProperties;
% props.setProperty('mail.smtp.auth','true');
% props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
% props.setProperty('mail.smtp.socketFactory.port','465');
% props.put('mail.smtp.starttls.enable','true');
% % Send the email.  Note that the first input is the address you are sending the email to
% sendmail('alper.basak@vodafone.com','Bitti')

h = actxserver('outlook.Application');
mail = h.CreateItem('olMail');
mail.Subject = 'Info: Bitti';
mail.To = 'alper.basak@vodafone.com';
mail.BodyFormat = 'olFormatHTML';
mail.HTMLBody = 'bitti';
mail.Send;