/*
  Warnings:

  - A unique constraint covering the columns `[codigo_product]` on the table `Ventas` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Ventas_codigo_product_key" ON "Ventas"("codigo_product");
