# IOS passkeys implementation

## Server

The server required NPM to be installed. 
The easyest way to run it locally is to use ngrok or OpenSource variant. This is a requirement as Apple CDN's need access to this endpoint. 

One of the files that needs to be updated is `apple-app-site-association`. You need to update the appID with a new one if updated.


## Client 

The application requires iOS 16. 
Knowing the server domain(localhost will not work), update in 
- AccountManager.swift
- Associated domains -> domains: webcredentials:<domain>


Run and play. 