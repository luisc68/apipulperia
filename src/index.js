// #1
import { PrismaClient } from "@prisma/client";
import express from "express";
import morgan from "morgan";
//#2
const prisma = new PrismaClient();
//#3
const app = express();

//#4
app.use(express.json());
app.use(morgan("tiny"));


//PRODUCTS

//POST
app.post('/products', async (req, res) => {
    const newproducts = await prisma.products.create({
        data: {
            codigo_p: req.body.codigo_p,
            nombre_p: req.body.nombre_p,
            precio_p: req.body.precio_p,
            categoria_p: req.body.categoria_p,
            peso_p: req.body.peso_p,
            marca_p: req.body.marca_p,
            cantidad_en_bodega_p: req.body.cantidad_en_bodega_p, //int colocalre int
            url_imagen_del_producto: req.body.url_imagen_del_producto,
            description_p: req.body.description_p,
        },
    });
    console.log("Nuevo producto agregado: ", newproducts);
    res.json(newproducts);
});

//GET BY CODIGO
app.get('/products/:codigo_p', async (req, res) => {
    const { codigo_p } = req.params;
    try 
    {
        const products = await prisma.products.findUnique({
            where: {codigo_p: codigo_p},});
        res.json(products);}
    catch (error)
    {console.log(error);
        res.status(404).json({ message: "Producto no encontrado" });
    }
});




//GET ALL ONLY PRODUCTS
app.get("/products", async (req, res) => {
    const productsnew = await prisma.products.findMany();
    res.json({
        success: true,
        data: productsnew,
        message: "Operation Successfuld",
    });
})

//UPDATE BY CODIGO WITH TRY AND CATCH
app.put('/products/:codigo_p', async (req, res) =>{
    const {codigo_p} = req.params;
    try {
        const updateproducts = await prisma.products.update({
            where: {codigo_p:(codigo_p) },
            data: req.body,
        });
        res.json({
            datos: updateproducts,
            mensaje: `El producto con el codigo ${codigo_p} fue actualizado exitosamente`,
    });
    } catch (e) {
        res.json({ error: `El producto con el codigo ${codigo_p} no existe` });
    }
});




//UPDATE BY ID WITH TRY AND CATCH
app.put('/productsid/:id', async (req, res) => {
    const { id } = req.params;
    try {
    const product = await prisma.products.update({
        where: { id: Number(id) },
        data: req.body,
    });
    res.json({
        data: product,
        mensaje: `El codigo con el id ${id} fue actualizado exitosamente`,
    });
    } catch (e) {
    res.json({ error: `El codigo con el id ${id} no existe` });
    }
});

//GET POR CODIGO SI LA CANTIDAD DEL PRODUCTO ES IGUAL A 0
app.get('/products/:codigo_p/:cantidad_en_bodega_p', async (req, res) => {
    const { codigo_p, cantidad_en_bodega_p } = req.params;
    try {
        const products = await prisma.products.findUnique({
            where: { codigo_p: String(codigo_p),
            cantidad_en_bodega_p: String(cantidad_en_bodega_p), },
        });
        if (products.cantidad_en_bodega_p === 0 ) {
            res.json({
                message: `El producto con el codigo ${codigo_p} no tiene existencias`,
            });
        } else {
            res.json({
                message: `El producto con el codigo ${codigo_p} tiene existencias`,
            });
        }
    } catch (error) {
        console.log(error);
        res.status(404).json({ message: "Producto no encontrado" });
    }
});






//DELETE BY CODIGO
app.delete('/products/:codigo_p', async (req, res) => {
    const { codigo_p } = req.params;
    try 
    {
        const products = await prisma.products.delete({
            where: {codigo_p: codigo_p},});
            res.json(`El producto con el codigo: ${codigo_p} fue eliminado exitosamente`);}
    catch (error)
    {console.log(error);
        res.status(404).json({ message: "Producto no encontrado, por favor ingrese el codigo correctamente" });
    }
});




//DELETE BY ID
app.delete('/productsid/:id', async (req, res) => {
    const { id } = req.params;
    try {
    const product = await prisma.products.delete({
        where: {
            id: Number(id),
        },
    });
    res.json({
        data: product,
        mensaje: `El producto con el id ${id} fue eliminado exitosamente`,
    });
    } catch (e) {
    res.json({ error: `El producto con el id ${id} no existe` });
    }
});

//VENTAS
//GET ALL
//revisar
app.get("/ventas", async (req, res) => {
    const ventasnew = await prisma.ventas.findMany({include:{prducto1:true}});
    res.json({
        success: true,
        data: ventasnew,
        message: "Operation Successfuld",
    });
})

//app.get("/ventas/:id", async function(req,res){
    //const ventas = await prisma.job.findUnique({ where: { id: Number(req.params.id) }, include: { product:true } });
    //res.json(ventas);
//});


//GET REvisar
//app.get('/ventas/:id', async (req, res) => {
    //const { id } = req.params;
    //const ventas = await prisma.ventas.findUnique({
        //where: {
            //id: id,
        //},
        //include: {
            //reference: true,
        //},
    //});
    //res.json(product);
//});



//GET BY CODIGO
app.get('/ventas/:codigo_v', async (req, res) => {
    const { codigo_v } = req.params;
    try
    {
        const ventas = await prisma.ventas.findUnique({include: { prducto1: true},
           where: {codigo_v: codigo_v},});
        res.json(ventas);}
    catch (error)
    {console.log(error);
        res.status(404).json({ message: "Venta no encontrada" });
    }
});

//POST
app.post("/ventas", async (req, res) => {
    const newventas = await prisma.ventas.create({
        data: req.body,
    });
    console.log("Nueva venta agregada: ", newventas);
    res.json(newventas);
});

//UPDATE
app.put('/ventas/:codigo_v', async (req, res) =>{
    const {codigo_v} = req.params;
    res.json({ message: `La venta con el codigo ${codigo_v}, no puede ser actualizada` });
});

//DELETE VENTAS POR CODIGO DE PRODUCTO
app.delete('/ventas/:codigo_product', async (req, res) => {
    const { codigo_product } = req.params;
    try
    {
        const ventas = await prisma.ventas.delete({
            where: {codigo_product: codigo_product},});
            res.json(`La venta con el codigo de producto: ${codigo_product} fue eliminada exitosamente`);}
    catch (error)
    {console.log(error);
        res.status(404).json({ message: "Venta no encontrada, por favor ingrese el codigo correctamente" });
    }
});

















//FINAL
app.use((req, res, next) => {
    res.status(404);
    return res.json({
      success: false,
      payload: null,
      message: `API SAYS: Endpoint not found for path: ${req.path}`,
  });
});
  
  app.listen(process.env.PORT || 8000, () =>
    console.log(`🚀 Example app listening on port 8000`)
);