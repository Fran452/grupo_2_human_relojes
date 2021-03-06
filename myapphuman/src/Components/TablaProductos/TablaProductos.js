import React, {useEffect, useState } from "react";

import "./TablaStyle.css";
const funciones = require("../Data/Data")

function TablaProductos () {

    const [product,setProduct] = useState([]);
     
    useEffect ( () => {
        funciones.fetchApi("http://localhost:3030/apis/product/productos").
        then(resultado => {
            console.log(resultado);
            setProduct(resultado)
        })
    },[]);

    return (
        <table className = "table"> 
            <tbody>
               <tr>
                    <th> Nombre Producto </th>   
                    <th> Tipo Poructo</th>
                    <th> Cantidad </th>
                    <th> Precio </th>
               </tr>
               
                {Array.isArray(product) && product.length > 0 ? product.map( product => {
                    return( 
                        <tr> 
                            <th> {product.nombre} </th> 
                            <th> {product.tipo} </th>
                            <th> {product.stock} </th> 
                            <th> {product.precio} </th> 
                        </tr>
                            )
                    }) : "cargando"}   
            </tbody>
        </table>
    )
}

export default TablaProductos;