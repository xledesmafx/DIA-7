--TOP CLIENTES CON MAS FACTURAS
select c.id,c.nombre,count(*) as "Cant Facturas" from cliente as c
join factura as f
on c.id=f.cliente_id
group by c.id
order by "Cant Facturas" desc
limit 5;

--Top clientes que más gastaron
select (c.nombre,c.apellido) as "Cliente",  CAST(SUM(pr.precio * fd.cantidad) AS DECIMAL(20, 1)) AS Gasto from cliente as c
join factura as f
on c.id = f.cliente_id
join factura_detalle as fd
on f.id=fd.factura_id
join producto as pr
on fd.producto_id = pr.id
group by "Cliente"
order by Gasto desc
limit 5;
 
 
--TOP MONEDAS MAS UTILIZADAS
select m.nombre,count(f.moneda_id) as "Cantidad Moneda"
from factura as f
join moneda as m
on f.moneda_id = m.id
group by m.nombre
order by "Cantidad Moneda" desc
limit 5;

--TOP PROVEEDORES DE PRODUCTOS
select pr.nombre,count(pr.nombre) as "Cantidad" from Producto as prod
join proveedor as pr
on prod.proveedor_id=pr.id
group by pr.nombre
order by "Cantidad" desc
limit 5;

--PRODUCTOS MAS VENDIDOS
select pr.nombre,CAST(SUM(fr.cantidad) AS DECIMAL(20, 1)) as "Cantidad" from Producto as pr
join factura_detalle as fr
on pr.id = fr.producto_id
group by pr.nombre 
order by "Cantidad" desc
limit 5;

--PRODUCTOS MENOS VENDIDOS
select pr.nombre,CAST(SUM(fr.cantidad) AS DECIMAL(20, 1)) as "Cantidad" from Producto as pr
join factura_detalle as fr
on pr.id = fr.producto_id
group by pr.nombre 
order by "Cantidad"
limit 5;

--Consulta que muestre fecha de emisión de factura, nombre y apellido del cliente,
--nombres de productos de esa factura, cantidades compradas, nombre de tipo de factura 
--de una factura específica
select fr.fecha_emision,c.nombre,c.apellido,pr.nombre,fd.cantidad,ft.nombre from producto pr
join factura_detalle as fd
on fd.producto_id = pr.id
join factura as fr
on fd.factura_id = fr.id
join factura_tipo as ft
on fr.factura_tipo_id = ft.id
join cliente as c
on fr.cliente_id = c.id;


--Montos de facturas ordenadas según totales
select fr.id as "NRO FACTURA",CAST(SUM(pr.precio*0.1 * fd.cantidad) AS DECIMAL(20, 1)) as "TOTAL"
from producto as pr
join factura_detalle as fd
on fd.producto_id = pr.id
join factura as fr
on fd.factura_id = fr.id
group by "NRO FACTURA"
order by "TOTAL" desc;

--Mostrar el iva 10% de los montos totales de facturas (suponer que todos los productos 
--tienen IVA 10%)
select fr.id as "NRO FACTURA",CAST(SUM((pr.precio*0.1) * fd.cantidad) AS DECIMAL(20, 1)) as "TOTAL IVA"
from producto as pr
join factura_detalle as fd
on fd.producto_id = pr.id
join factura as fr
on fd.factura_id = fr.id
group by "NRO FACTURA"
order by "TOTAL IVA" desc;
















