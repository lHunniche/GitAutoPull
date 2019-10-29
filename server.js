var http = require('http');
var fs = require('fs');
var url = require('url');

http.createServer(function (req, res) {
    res.writeHead(200, {
        'Content-Type': 'text/html'
    });
    var endPoint = req.url;
    var queryData = url.parse(req.url, true).query;
    console.log(queryData);
    fs.mkdir();
        fs.writeFile('writeMe.txt', data, function(err, result) {
         if(err) console.log('error', err);
       });
    
    if (endPoint === "/append") {
//        fs.appendFile(queryData.file + '.txt', queryData.content, function (err) {
//          if (err) throw err;
//          res.write('Saved!');
//        });
    }
    else if (endPoint === "/reset") {
       
    }
    else if(endPoint === "/print") {
       
    }
    res.end("\nGood Bye");
}).listen(8080);


//function handleAppend(req, res, data) {
//    
//    fs.appendFileSync("C:\Users\Lasse\Desktop\serverexample\\" + data.file + '.txt', data.content, function (err) {
//      if (err) throw err;
//      res.write('Saved!');
//    });
//}

//function handleReset(req, res) {
//    var q = url.parse(req.url, true).query;
//    
//    fs.writeFile(q.file + '.txt', "", function (err) {
//        if (err) throw err;
//        res.write("File with the name: " + q.file + ".txt has been reset")
//    })
//}

function callbackFunction(err, result)
{
    console.log("this is a callback");
}

//function handlePrint(req, res) {
//    var q = url.parse(req.url, true).query;
//    
//    fs.readFile(q.file + ".txt", function (err, data) {
//        res.write(data)
//    })
//    res.write("print")
//}

console.log("Running...")