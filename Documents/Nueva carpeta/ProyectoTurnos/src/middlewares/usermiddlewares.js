const usermiddlewares = {
    
    admin : (req,res,next) => {
        if(req.session.user.admin){
            next();
        }
        res.send("no tiene los permisos de administrador");
    },
    userRegister: (req,res,next) => {
        if(req.session.user){
            next();
        }
        res.redirect("/user/register");
    },
    reinCookies: (req,res,next) => {
        if(req.cookies?.user){
            res.cookie("user",req.cookies.user,{maxAge : 3000000000**1000000000000});
            next();
        }
        next();
    },
    guardarRegistro: (req,res,next) => {
        if(req.session.user){
            res.locals.user = req.session.user;
            next();
        }
        next();
    }

}

module.exports = usermiddlewares