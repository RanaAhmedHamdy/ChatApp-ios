# ChatApp-ios
Chat app is app where people can create accounts and channels with different descriptions to chat with each other.

# Features
- User can create an account with name, email and password.
- User can pic an avatar and generate random background colors for it.
- User can Login in after that and view his/her profile.
- User can create new channel with name and description.
- User can view available channels.

# Cocopods
The used cocopods in this app are:
- Alamofire
- SwiftyJSON
- SocketIOClient

# Required
This app needs a server to be used, you can deploy the api code on heroku or use a localhost.
The mac-chat-api code: https://github.com/devslopes/mac-chat-api
If you want to use heroku:
- First, open the above link and press the DeployToHeroku button in the readme file.
- Then after ou download this code, open Constants.swift file and change the BASE_URL with yours

If you will be using localhost:
- Download node.js
- Download mongodb
- Download Robo3T
- Download the api-code from the above link
- Open the terminal and write this command: brew services start mongodb
- Then navigate to api folder and write this command: npm run dev
- Open Robo3T, press connect to see the data in your local db

# Screenshots
![screen shot 2017-11-29 at 11 33 00 am](https://user-images.githubusercontent.com/12214142/33369489-6c6acc5a-d4fd-11e7-9a1a-784a7508791a.png)
![screen shot 2017-11-29 at 11 33 11 am](https://user-images.githubusercontent.com/12214142/33369490-6c8e2f60-d4fd-11e7-9e49-775517a35423.png)
![screen shot 2017-11-29 at 11 33 43 am](https://user-images.githubusercontent.com/12214142/33369491-6cafcc88-d4fd-11e7-8a9a-0187471c879e.png)
![screen shot 2017-11-29 at 11 33 52 am](https://user-images.githubusercontent.com/12214142/33369492-6cd61460-d4fd-11e7-96aa-c692cf7d261c.png)
![screen shot 2017-11-29 at 11 34 07 am](https://user-images.githubusercontent.com/12214142/33369493-6cfe9908-d4fd-11e7-8f64-98151f22e7b4.png)
![screen shot 2017-11-29 at 11 34 22 am](https://user-images.githubusercontent.com/12214142/33369494-6d29eacc-d4fd-11e7-8674-cd4faba9333e.png)
![screen shot 2017-11-29 at 11 34 38 am](https://user-images.githubusercontent.com/12214142/33369495-6d5080ec-d4fd-11e7-988e-31a5d22ae038.png)
![screen shot 2017-11-29 at 11 43 14 am](https://user-images.githubusercontent.com/12214142/33369496-6d72249a-d4fd-11e7-85c2-824baa9cbcf6.png)
![screen shot 2017-11-29 at 11 43 28 am](https://user-images.githubusercontent.com/12214142/33369499-6d9d80c2-d4fd-11e7-86e5-00e15f236cde.png)
![screen shot 2017-11-29 at 11 43 40 am](https://user-images.githubusercontent.com/12214142/33369500-6dc04aee-d4fd-11e7-9d54-82904072ba18.png)

# To be added
- Create messages controller using sockets for realtime messaging
