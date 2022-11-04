/*
  Warnings:

  - You are about to drop the `Products` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Ventas` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Ventas" DROP CONSTRAINT "Ventas_productoId_fkey";

-- DropTable
DROP TABLE "Products";

-- DropTable
DROP TABLE "Ventas";

-- CreateTable
CREATE TABLE "products" (
    "id" SERIAL NOT NULL,
    "codigo_p" TEXT NOT NULL,
    "nombre_p" TEXT NOT NULL,
    "precio_p" DOUBLE PRECISION NOT NULL,
    "categoria_p" TEXT NOT NULL,
    "peso_p" DOUBLE PRECISION NOT NULL,
    "marca_p" TEXT NOT NULL,
    "cantidad_en_bodega_p" INTEGER NOT NULL,
    "url_imagen_del_producto" TEXT NOT NULL,
    "description_p" TEXT NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ventas" (
    "id" SERIAL NOT NULL,
    "codigo_v" TEXT NOT NULL,
    "nombre_product" TEXT NOT NULL,
    "codigo_product" TEXT NOT NULL,
    "cantidad_product" TEXT NOT NULL,
    "precio_product" TEXT NOT NULL,
    "fecha" TIMESTAMP(3),
    "total" TEXT NOT NULL,
    "descripcion_v" TEXT NOT NULL,
    "url_imagen_producto" TEXT NOT NULL,
    "metodo_de_pago" TEXT NOT NULL,
    "productoId" INTEGER NOT NULL,

    CONSTRAINT "ventas_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "products_codigo_p_key" ON "products"("codigo_p");

-- CreateIndex
CREATE UNIQUE INDEX "ventas_codigo_v_key" ON "ventas"("codigo_v");

-- CreateIndex
CREATE UNIQUE INDEX "ventas_codigo_product_key" ON "ventas"("codigo_product");

-- AddForeignKey
ALTER TABLE "ventas" ADD CONSTRAINT "ventas_productoId_fkey" FOREIGN KEY ("productoId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
