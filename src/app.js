/************* Metodos requeridos ****************/ 
const express = require("express");
const path = require("path");
const methodOverride = require ("method-override");
const session = require("express-session");
const { applyEachSeries } = require("async");
const cookieParser = require("cookie-parser");
const userMiddlewares = require("./middlewares/userMiddlewares");
require("dotenv").config()
/*********** Rutas inportada ***************************/
const rutasUser = require("./routes/user");
const rutasProductos = require("./routes/productos");
const rutasMain = require("./routes/main");
const apisUSer = require("./routes/apis")

/******** Diferentes funcionamientos ****************/
const PORT = process.env.PORT || 3030;
console.log(process.env.casa);
const app = express();
const publicPath = path.join(__dirname,"../","public");

/*************** Middlewares *************************/
app.use(express.static(publicPath));
app.use(methodOverride('_method'));
app.use(express.urlencoded({extended : false}));
app.use(session({secret : "contraseñaLinda",resave : false, saveUninitialized : false}));
app.set("view engine","ejs");
app.use(cookieParser());
app.set("views","./src/views");

/***** Middlewares Propios *************************************/
app.use(userMiddlewares.integrarCookies);

/***************** Rutas **********************/
app.use('/',rutasMain);

app.use('/user', rutasUser);

app.use('/product',rutasProductos);

app.use('/apis', apisUSer);

/**************** Inicio de apliacion ***************************/

app.listen(PORT, () => {
    console.log(`Servidor en funcionamiento en el puerto http://localhost:${PORT}` );
});

/**************** Error 404 ***************************/
app.use((req,res,next) => {
    res.status(404).render("not-found")
})
