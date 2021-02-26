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

    
    if (endPoint.includes("/githook")) {
        handleGitPull(req, res, queryData);
    }
    else{
        res.end("Good bye dude");
    }

}).listen(8082);



function handleGitPull(req, res, queryData) {
    if (queryData.id === "1") {
        shell.exec("bash /home/lklev16/github/GitAutoPull/pullBandim.sh");
    }
    res.end("Pulling..")
}

console.log("Running...")