

const express=require("express");
const app=express();

const accountSid = "ACf92777a4ea491b829cc53befa63ef6e9"
const authToken = "28483a64fd5e51cb3094f953ad3f3db1";
const seviceSid ='VA1102ccf609cf04e3eb63bbb2b8573ee9'; 
const port=5003;
// const otp =Math.floor(100000 + Math.random() * 900000);
const client = require('twilio')(accountSid, authToken);
let x= Math.floor((Math.random()*10000)+1);
// let num = document.getElementsByClassName("inp").value;
client.messages
  .create({
    
    body: 'Hello from twilio-node your OTP is '+x+'. Thanks for choosing our service!',
    
    to:'+917605859133', // Text your number
    from: '+12674227282', // From a valid Twilio number
  })
  .then((message) => console.log(message.sid));

app.listen(port, () => {
    console.log(`Server running on ${port}`);
});