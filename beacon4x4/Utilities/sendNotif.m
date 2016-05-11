% Define these variables appropriately:
mail = 'ab17189@gmail.com'; %Your GMail email address
password = 'a8b9t9b6';  %Your GMail password
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
props.put('mail.smtp.starttls.enable','true');
% Send the email.  Note that the first input is the address you are sending the email to
sendmail('alper.basak@vodafone.com','Bitti')