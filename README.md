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