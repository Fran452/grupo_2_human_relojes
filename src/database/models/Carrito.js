const database = require("mime-db");

module.exports = (sequelize,dataTypes) => {

    let nombre = "carrito";
    let columnas = {

        id:{
            primaryKey: true,
            unique: true,
            autoIncrement: true,
            type : dataTypes.INTEGER
        },
        id_usuario:{
            allowNull: false,
            type : dataTypes.INTEGER 
        }
    };
    let config =  {
        timestamps: false,
        tableName : "Carrito"
    };

    const carrito = sequelize.define(nombre,columnas,config);

    carrito.associate = models => {
        carrito.belongsTo(models.usuarios,{
            foreignKey : 'id_usuario',
            as : 'usuarios'
        });
        carrito.belongsToMany(models.productos,{
            as: 'productos',
            through : 'CarritoProducto',
            foreignKey : 'id_carrito',
            otherKey: 'id_producto',
            timestamps : false
            
        });
        carrito.hasMany(models.carritoProducto,{
            foreignKey : 'id_carrito',
            as : 'carritoProducto'
        });
    }

    return carrito;
};



