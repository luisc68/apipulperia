-- DropForeignKey
ALTER TABLE "Pulperia" DROP CONSTRAINT "Pulperia_ventasId_fkey";

-- DropForeignKey
ALTER TABLE "Ventas" DROP CONSTRAINT "Ventas_singer1Id_fkey";

-- AlterTable
ALTER TABLE "Pulperia" ALTER COLUMN "ventasId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Ventas" ALTER COLUMN "singer1Id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Ventas" ADD CONSTRAINT "Ventas_singer1Id_fkey" FOREIGN KEY ("singer1Id") REFERENCES "Products"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pulperia" ADD CONSTRAINT "Pulperia_ventasId_fkey" FOREIGN KEY ("ventasId") REFERENCES "Ventas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
