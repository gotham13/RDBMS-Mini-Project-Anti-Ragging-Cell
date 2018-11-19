var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var fileUpload=require('express-fileupload');
var indexRouter = require('./routes/index');
var complaintRouter = require('./routes/complaint');
var undertakingRouter = require('./routes/undertaking');
var loginSignupLogoutRouter = require('./routes/dashboard');
var summaryRouter = require('./routes/summary');
var app = express();
var connection  = require('express-myconnection');
var mysql = require('mysql');
var session = require('express-session');
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(fileUpload());
app.use(
    connection(mysql,{
        host: 'localhost', //'localhost',
        user: 'root',
        password : '',
        port : 3306, //port mysql
        database:'anti_ragging'
    },'pool') //or single
);
app.use(session({
    secret: "chachamama",
    resave: false,
    saveUninitialized:false,
}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use('/information', express.static(path.join(__dirname, 'public','information.html')));
app.use('/faq', express.static(path.join(__dirname, 'public','faq.html')));
app.use('/useful_contacts', express.static(path.join(__dirname, 'public','useful_contacts.html')));
app.use('/', indexRouter);
app.use('/complaint', complaintRouter);
app.use('/undertaking', undertakingRouter);
app.use('/dashboard',loginSignupLogoutRouter);
app.use('/summary',summaryRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
