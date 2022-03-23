const express = require("express");
const path = require("path");
const rutasUser = require("./routes/user")
const rutasProductos = require("./routes/productos")
const rutasMain = require("./routes/main")


const PORT = process.env.PORT || 3000;

const app = express();


const publicPath = path.join(__dirname,"../","public");

app.use(express.static(publicPath));

app.set("view engine","ejs");

app.listen(PORT, () => {
    console.log("Servidor en funcionamiento en el puerto "+ PORT);
});

app.use('/',rutasMain);

app.use('/user', rutasUser);


app.use('/producto',rutasProductos);