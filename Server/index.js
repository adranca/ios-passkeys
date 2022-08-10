
var express = require('express');
var server = express();
var accounts = {"CF03FD4E-F218-4154-8FA5-510921ABC3AF":"test name",
                "C2DB37BB-2BAB-4950-9F8E-C30F0FD0F88B":"test name"};

// This will be call by APPLE TO VERIFY THE APP-SITE-ASSOCIATION 
// Make the 'apple-app-site-association' accessable to apple to verify the association
server.get('/.well-known/apple-app-site-association', function(request, response) {
  response.sendFile(__dirname +  '/apple-app-site-association');
});

server.get('/apple-app-site-association', function(request, response) {
  response.sendFile(__dirname +  '/apple-app-site-association');
});

// HOME PAGE
server.get('/home', function(request, response) {
  response.sendFile(__dirname +  '/home.html');
});

// ABOUT PAGE
server.get('/about', function(request, response) {
  response.sendFile(__dirname +  '/about.html');
});

server.get('/auth', function(request, response) {
  var username=request.get("username")
  var id=request.get("userID")
  accounts[id]=username
  response.json({ "Message":"Successfull" });
});

server.get('/login', function(request, response) {
  var user = request.get("userID")
  var account = accounts[user]
  console.log("login"+account + accounts);
  response.json({ "name":account });
});

server.listen(80);
