-- CreateTable
CREATE TABLE "Products" (
    "id" SERIAL NOT NULL,
    "codigo_p" TEXT NOT NULL,
    "nombre_p" TEXT NOT NULL,
    "precio_p" DOUBLE PRECISION NOT NULL,
    "categoria_p" TEXT NOT NULL,
    "peso_p" DOUBLE PRECISION NOT NULL,
    "marca_p" TEXT NOT NULL,
    "cantidad_en_bodega_p" TEXT NOT NULL,
    "url_imagen_del_producto" TEXT NOT NULL,
    "description_p" TEXT NOT NULL,

    CONSTRAINT "Products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ventas" (
    "id" SERIAL NOT NULL,
    "codigo_v" TEXT NOT NULL,
    "nombre_product" TEXT NOT NULL,
    "codigo_product" TEXT NOT NULL,
    "cantidad_product" TEXT NOT NULL,
    "precio_product" TEXT NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "total" TEXT NOT NULL,
    "descripcion_v" TEXT NOT NULL,
    "url_imagen_producto" TEXT NOT NULL,
    "metodo_de_pago" TEXT NOT NULL,
    "singer1Id" INTEGER NOT NULL,

    CONSTRAINT "Ventas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pulperia" (
    "id" SERIAL NOT NULL,
    "nombre_p" TEXT NOT NULL,
    "direccion_p" TEXT NOT NULL,
    "telefono_p" TEXT NOT NULL,
    "vendedor_p" TEXT NOT NULL,
    "ventasId" INTEGER NOT NULL,

    CONSTRAINT "Pulperia_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Products_codigo_p_key" ON "Products"("codigo_p");

-- CreateIndex
CREATE UNIQUE INDEX "Ventas_codigo_v_key" ON "Ventas"("codigo_v");

-- CreateIndex
CREATE UNIQUE INDEX "Pulperia_ventasId_key" ON "Pulperia"("ventasId");

-- AddForeignKey
ALTER TABLE "Ventas" ADD CONSTRAINT "Ventas_singer1Id_fkey" FOREIGN KEY ("singer1Id") REFERENCES "Products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pulperia" ADD CONSTRAINT "Pulperia_ventasId_fkey" FOREIGN KEY ("ventasId") REFERENCES "Ventas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
