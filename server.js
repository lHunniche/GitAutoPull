var http = require('http');
var fs = require('fs');
var url = require('url');
var shell = require('shelljs')

http.createServer(function (req, res) {
    res.writeHead(200, {
        'Content-Type': 'text/html'
    });
    var endPoint = req.url;
    var queryData = url.parse(endPoint, true).query;
    
    if (endPoint.includes("/append")) {
        console.log("Appending...")
        handleAppend(req, res, queryData);
    }
    else if (endPoint.includes("/reset")) {
        handleReset(req, res, queryData);
    }
    else if (endPoint.includes("/print")) {
        handlePrint(req, res, queryData);
    }
    else if (endPoint.includes("/githook")) {
        handleGitPull(req, res, queryData);
    }
    else{
        res.end("Good bye suckah");
    }

}).listen(8080);


function handleAppend(req, res, data) {
    
    fs.appendFileSync(data.file + '.txt', data.content + "\n", function (err, result) {
      if (err) throw err;
      res.write('Saved!');
    });
    res.end("\nGood Bye");
}

function handleReset(req, res, data) {
    
    fs.writeFileSync(data.file + '.txt', "")
    res.end("\nGood Bye");
}

function handlePrint(req, res, queryData) {
    if (fs.existsSync(queryData.file + ".txt")) {
        var data = fs.readFileSync(queryData.file + ".txt").toString().split(String.fromCharCode(10));
        var collectedString = "";
        for (var i = 0; i < data.length; i++) {
            res.write(data[i] + "<br>")
        } 
    }
    
    res.end("\nDone printing");
}

function handleGitPull(req, res, queryData) {
    if (queryData.id === "1") {
        shell.exec("~/pull.sh");
    }
    res.end("Pulling..")
}

console.log("Running...")









