const express=require("express")
const app = express()

// Your AccountSID and Auth Token from console.twilio.com
const accountSid = 'ACf92777a4ea491b829cc53befa63ef6e9';
const authToken = '33e02655d82293d8fea439187e4315e3 ';

const client = require('twilio')(accountSid, authToken);
let x= Math.floor((Math.random()*10000)+1);
client.messages
  .create({
    body: 'Hello from Bank of Bihar. Your OTP is '+x+'. Thanks for choosing our service!',
    to: '+91 99078 25469', // Text your number
    from: '+12674227282', // From a valid Twilio number
  })
  .then((message) => console.log(message.sid));

app.listen(8080,()=>{
    console.log("server running at 8080")
})