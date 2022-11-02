/*
  Warnings:

  - Made the column `ventasId` on table `Pulperia` required. This step will fail if there are existing NULL values in that column.
  - Made the column `singer1Id` on table `Ventas` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Pulperia" DROP CONSTRAINT "Pulperia_ventasId_fkey";

-- DropForeignKey
ALTER TABLE "Ventas" DROP CONSTRAINT "Ventas_singer1Id_fkey";

-- AlterTable
ALTER TABLE "Pulperia" ALTER COLUMN "ventasId" SET NOT NULL;

-- AlterTable
ALTER TABLE "Ventas" ALTER COLUMN "fecha" DROP NOT NULL,
ALTER COLUMN "singer1Id" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Ventas" ADD CONSTRAINT "Ventas_singer1Id_fkey" FOREIGN KEY ("singer1Id") REFERENCES "Products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pulperia" ADD CONSTRAINT "Pulperia_ventasId_fkey" FOREIGN KEY ("ventasId") REFERENCES "Ventas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
