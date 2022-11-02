/*
  Warnings:

  - You are about to drop the `Pulperia` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Pulperia" DROP CONSTRAINT "Pulperia_ventasId_fkey";

-- DropTable
DROP TABLE "Pulperia";
