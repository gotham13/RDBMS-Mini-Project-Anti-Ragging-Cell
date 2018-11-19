var express = require('express');
var router = express.Router();

var checkSignIn = function (req) {
    if(req.session.user){
        return true;     //If session exists, proceed to page
    } else {
        return false;
    }
};

/* GET home page. */
router.get('/', function(req, res, next) {
    var msg=req.query.msg;
    sgn=false;
    if(checkSignIn(req))
    {
        sgn=true;
    }
    if(typeof msg=="undefined")
     msg=null;
    res.render('index', { title: 'Express',sgn:sgn ,msg:msg});
});

router.get('/feedback', function(req, res, next) {
    res.render('feedback',{submitted:false});
});

router.post('/feedback',function (req,res,next) {
    var body = req.body;
    req.getConnection(function (err, connection) {
        if (err) {
            res.send({
                "code": 400,
                "failed": "error ocurred"
            })
        }
        else {
            var sql = `INSERT INTO feedback(name,email,address,pincode,mobile,state,feedback) values(?,?,?,?,?,?,?)`;
            connection.query(sql, [body.name,body.email,body.address,body.pincode,body.mobile,body.state,body.feedback], function (error, results) {
                if (error) {
                    console.log("error ocurred", error);
                } else {
                    res.render('feedback',{submitted:true});
                }
            });
        }
    });
});

module.exports = router;
