provider "vault" {
  address = "https://vault-internal.pdevops78.online:8200"
  token = "hvs.T8WnPWmYmGZkPYlGAHXVmebk"
  skip_tls_verify = true
}


# mongodb://docdb:<insertYourPassword>@docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/


# DOCUMENTDB == 'true'

# mongodb://docdb:roboshop123@docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/catalogue?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false


# mongodb://docdb:roboshop123@docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/users?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false

# 'mongodb://docdb:roboshop123@docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/users?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false'

rds-dev.cvkemucwmc9p.us-east-1.rds.amazonaws.com ---->rds
redis-dev.orvmwx.0001.use1.cache.amazonaws.com:6379 ---->redis


wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
Connect to this instance with the mongo shell
Copy
mongosh docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017 --tls --tlsCAFile global-bundle.pem --retryWrites=false --username docdb --password <insertYourPassword>
Connect to this instance with an application
Copy
mongodb://docdb:<insertYourPassword>@docdb-cluster-demo-0.cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&retryWrites=false