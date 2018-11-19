var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.render('undertaking', { title: 'Express',submitted:false});
});
router.post('/',function (req,res,next) {
    var body = req.body;
    for (var key in body) {
        if(body[key] == "") {
            body[key] = null;
        }
    }
    console.log(body);
    //console.log(Object.values(body));
    req.getConnection(function (err,connection) {
        if (err) {
            res.send({
                "code": 400,
                "failed": "error ocurred here"
            })
        }
        else {
            var nul_arr=[null,null];
            body_arr = Object.values(body);
            var sql = 'INSERT INTO `undertaking`(`student_family_name`, `student_first_name`, ' +
                '`student_middle_name`, `gender`, `nationality`, `student_mobile_no`, `student_freind_mob_no`,' +
                ' `student_email_id`, `student_p_address1`, `student_p_address2`, `student_city`, `student_state`, ' +
                '`pg_name`, `pg_address1`, `pg_address2`, `pg_city`, `pg_state`, `pg_mobile`, `pg_email`, `degree`, ' +
                '`name_of_course`, `reg_no`, `no_of_students`, `year_of_study`) ' +
                'VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)';

            connection.query(sql,body_arr, function (error, result) {
                if (error) {
                    console.log(error);
                    // console.log("error ocurred",error);
                    res.send({
                        "code": 400,
                        "failed": "error ocurred"
                    })
                } else {
                    console.log("done");
                    connection.query('SELECT LAST_INSERT_ID()',function (error, result) {
                        if (error) {
                            console.log(error);
                        }
                        else{
                            res.render('undertaking', { submitted:true, id:result[0]['LAST_INSERT_ID()'],
                                name:body.s_fi_name+" "+body.s_mi_name+" "+body.s_fy_name,
                                email:body.s_e_id,mobile:body.s_m_no});
                        }
                    })
                }
            });
        }
    });
});

router.get('/undertaking_count', function(req, res, next) {
    req.getConnection(function (err,connection) {
        if (err) {
            console.log(err)
        }
        else {
            var sql="SELECT count(*) as count from undertaking"
            connection.query(sql,'', function (error, result) {
                if (error) {
                    console.log(error);
                } else {
                    res.send({
                        "error":false,
                        "total_undertakings":result[0].count
                    })
                }
            });
        }
    });
});

module.exports = router;