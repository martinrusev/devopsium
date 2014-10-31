AmonOne has 2 main parts:
<br>

* **amonone-collector** - A collector daemon 

* **amonone** - Web application, that displays the information

AmonOne stores everything in a Mongo database, you can check if that's working by typing <code>mongo</code> in
the terminal. If mongo is working properly, the message that you will see after typing the command
should say <code>Connected to test</code>


 
## Controlling the collector daemon

The collector daemon is started automatically when you boot your operation system. It's located in <code>
/etc/init.d/amonone-collector</code> and you can control it with the following commands:

* **status** - returns the current status of the daemon. If AmonOne is running properly this command should return 
<code> AmonOne is running as PID ... </code>


* **restart** - restarts the daemon, you should always do that, after altering the configuration file

* **stop**- stops the daemon

* **start** - starts the daemon and displays <code>AmonOne started as PID ... </code> if successfull

Depending on your operating system, you probably should run these commands as root <br><br>
<code>sudo /etc/init.d/amonone-collector start|stop|restart</code>

If the daemon doesn't start or is not working properly, you can check */usr/local/amonlite/amonone-collector.log* for detailed
information about the problem.

## Controlling the web interface

To save resources, the web interface is not started with your operating system, so you have to start it manually. 
It's located in <code>/etc/init.d/amonone</code> and you can control it with the following commands:


* **status** - returns the current status of the web app. This command should return <br><br>
<code> AmonOne .. version .. is running as PID. The AmonOne web interface is running on http://127.0.0.1:2464</code>


* **restart** - restarts the web application

* **stop** - stops the web application

* **start** - starts the web application and displays <br><br><code>The AmonOne web interface is running on http://127.0.0.1:2464 </code>

You can control both the port and the host from the configuration file. The Web interface is *mandatory* if you want to collect log information and exception data.

If the web app doesn't start, you can check */var/log/amonone/amonone.log* for detailed
information about the problem.


