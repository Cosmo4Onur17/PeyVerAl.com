
// importing libraries
var express = require("express");
var app = express();
var path = require("path")

app.use("/css",express.static(path.join(__dirname,"views/css")));
app.set("view engine","ejs");

// routing

app.get("/",function(req,res){
    res.send("home");
});


app.get("/login",function(req, res){
    res.render("login");
});

app.get("/signup",function(req,res){
    res.render("signup");
});

// routing end



var server = app.listen(3000,function(){
    console.log("sunucu su anda port numarasinda : %d",server.address().port);
});









