import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  const newproducts = await prisma.products.create({
    data: {
        codigo_p: "123456",
        nombre_p: "Tomate",
        precio_p: 100,
        categoria_p: "Vegetales",
        peso_p: 100,
        marca_p: "Marca Tomate",
        cantidad_en_bodega_p: "100",
        url_imagen_del_producto: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FTomate&psig=AOvVaw1rk2Aert7j2NKmwoQAWhAw&ust=1667266668576000&source=images&cd=vfe&ved=0CA0QjRxqFwoTCLjT_rWqifsCFQAAAAAdAAAAABAE",
        description_p: "Tomates organicos, frescos del campo a tu casa",

      
    },
  });
  console.log("Nuevo producto agregado: ", newproducts);
  const todosproduct = await prisma.products.findMany();
  console.log("Todos los productos que hay son: ");
  console.dir(todosproduct, { depth: null });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });