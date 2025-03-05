# roboshop-project

* to run mongodb through cli we can use and install the below command
  dnf install mongodb-org-shell -y

wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
Connect to this instance with the mongo shell
Copy
mongosh docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017 --tls --tlsCAFile global-bundle.pem --retryWrites=false --username docdb --password <insertYourPassword>
Connect to this instance with an application
Copy
mongodb://docdb:<insertYourPassword>@docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&retryWrites=false

Redis:redis-dev.orvmwx.0001.use1.cache.amazonaws.com:6379
.DOCUMENTDB == 'true'
'mongodb://docdb:<insertYourPassword>@my-docdb-cluster.cluster-cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/users?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false';


Install mongosh:
================
* sudo rpm --import https://www.mongodb.org/static/pgp/server-6.0.asc
* vim /etc/yum.repos.d/mongodb-org-6.0.repo
  [mongodb-org-6.0]
  name=MongoDB Repository
  baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/6.0/x86_64/
  gpgcheck=1
  enabled=1
* sudo yum install -y mongodb-mongosh
* mongosh
 the above steps for mongosh installed


service data:
=============
RDS:
====
rds-dev.cvkemucwmc9p.us-east-1.rds.amazonaws.com

elasticache:
============
redis-dev.orvmwx.0001.use1.cache.amazonaws.com:6379 

DocumentDB:
===========
Install pem file:
=================

wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem

Connect to this instance with the mongo shell
=============================================
mongosh docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017 --tls --tlsCAFile global-bundle.pem --retryWrites=false --username docdb --password <insertYourPassword>

Connect to this instance with an application
============================================
mongodb://docdb:<insertYourPassword>@docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&retryWrites=false