# Jenkins CI/CD pipeline


<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/jenkins"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Jenkins server with CI/CD on Elestio

<img src="jenkins.jpg" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can can open Jenkins UI here:

    URL: https://[CI_CD_DOMAIN]

You will have to complete the initial setup and you will require the initial password. 

To find the initial password open a terminal from your pipeline dashboard and type:

    docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

Copy the password displayed (Eg: fcdd2545d3f8418c82f6280034440729)

Then complete the web setup here: https://[CI_CD_DOMAIN]

It's recommended to install the default plugins when requested in the setup. 

You will also be asked to create the first admin account, you can use those credentials when creating your admin account

    Login: root
    password: [ADMIN_PASSWORD]

If you wish to get email notifications about builds status, you should configure SMTP settings through WEB UI, follow to the "Manage Jenkins/Configure System" menu Item. Find there "E-mail Notification" section and fill "SMTP server" field with 172.17.0.1, port 25 without TLS, and set the email FROM address to [DOMAIN]@vm.elestio.app. Alternatively you can setup any third party SMTP service.

