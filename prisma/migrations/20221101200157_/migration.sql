/*
  Warnings:

  - You are about to drop the column `singer1Id` on the `Ventas` table. All the data in the column will be lost.
  - Added the required column `productoId` to the `Ventas` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Ventas" DROP CONSTRAINT "Ventas_singer1Id_fkey";

-- AlterTable
ALTER TABLE "Ventas" DROP COLUMN "singer1Id",
ADD COLUMN     "productoId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Ventas" ADD CONSTRAINT "Ventas_productoId_fkey" FOREIGN KEY ("productoId") REFERENCES "Products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
