var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    req.getConnection(function (err, connection) {
        if (err) {
            res.send({
                "code": 400,
                "failed": "error ocurred"
            })
        }
        else {
            var sql = `SELECT * from complaint`;
            connection.query(sql, [], function (error, results) {
                res.render('summary', {data:results});
            })
        }
    });
});


module.exports = router;
