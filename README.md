# Python CRUD API 

# Overview: 

-  It is a simple python Flask based CRUD API which is storing items in a simple in-memory list.
-  A dockerfile to create a docker image which is stored in azure container registry.
-  Terraform code to deploy AKS CLuster. tfstate file is stored in azure storage.
-  Helm charts to deploy the CRUD API image to AKS.
-  GitHub action CI-CD pipeline to execute above steps.

# Testing CRUD API: 

-  curl -X GET http://localhost/items
-  curl -X GET http://localhost/items/2
-  curl -X POST -H "Content-Type: application/json" -d '{"name": "Mobile"}' http://localhost/items
-  curl -X PUT -H "Content-Type: application/json" -d '{"name": "Eraser"}' http://localhost/items/3
-  curl -X DELETE -H "Content-Type: application/json" -d '{"name": "Eraser"}' http://localhost/items/4
