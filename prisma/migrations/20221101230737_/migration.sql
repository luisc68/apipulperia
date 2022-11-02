/*
  Warnings:

  - Changed the type of `cantidad_en_bodega_p` on the `Products` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Products" DROP COLUMN "cantidad_en_bodega_p",
ADD COLUMN     "cantidad_en_bodega_p" INTEGER NOT NULL;
