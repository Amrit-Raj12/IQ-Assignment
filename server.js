const express = require("express");
const bodyparser = require("body-parser");
const mysqlConnection = require("./connection");
const path = require("path");


var app=express();

app.set('views', path.join(__dirname,'views'));

app.set('view engine', 'ejs');
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({extended:false}));

app.get('/',(req,res)=>{
  let sql="SELECT * from tb_user";
  let query = mysqlConnection.query(sql, (err, rows)=>{
    if(err) throw err;
    res.render('user_index',{
      title:"IQ-Table",
      tb_user: rows
   });
  });
});

app.get('/specific_user',(req,res)=>{
  let sql="select * from tb_user WHERE user_id=1 or user_id=5 or user_id=7";
  let query = mysqlConnection.query(sql, (err, rows)=>{
    if(err) throw err;
    res.render('user_index',{
      title:"IQ-Table",
      tb_user: rows
   });
  });
});

app.get('/admin_user',(req,res)=>{
  let sql="select a.admin_id,b.user_name,b.created_at from tb_admin A inner join tb_user B on a.admin_id=b.admin_id where a.admin_id<=3";
  let query = mysqlConnection.query(sql, (err, rows)=>{
    if(err) throw err;
    res.render('admin_user',{
      title:"IQ-Table",
      tb_admin: rows
   });
  });
});

app.get('/add', (req, res)=>{
  res.render('user_add',{
    title:"Crud Operation using Nodejs"
  });
});

app.post('/save', (req, res)=>{
  let data ={admin_id: req.body.admin_id, user_name: req.body.user_name};
  let sql = "INSERT into tb_user SET ?";
  let query = mysqlConnection.query(sql, data,(err, results)=>{
    if(err) throw err;
    res.redirect('/');
  });
});

app.get('/edit/:admin_id',(req, res)=>{
  const admin_id = req.params.admin_id;
  let sql = `Select * from tb_user where user_id = ${admin_id}`;
  let query = mysqlConnection.query(sql, (err, result)=> {
    if(err) throw err;
    res.render('user_edit', {
      title: "IQ-Table",
      tb_user: result[0]
    });
  });
});

app.post('/update', (req, res)=>{
  const admin_id = req.body.admin_id;
  let sql = "update tb_user SET admin_id='"+req.body.admin_id+"', user_name='"+req.body.user_name+"' where admin_id ="+admin_id;
  let query = mysqlConnection.query(sql,(err, results)=>{
    if(err) throw err;
    res.redirect('/');
  });
});

app.get('/delete/:user_id',(req, res)=>{
  const user_id = req.params.user_id;
  let sql = `DELETE from tb_user where admin_id = ${user_id}`;
  let query = mysqlConnection.query(sql, (err, result)=> {
    if(err) throw err;
    res.redirect('/');
    });
  });


app.listen(3000);
