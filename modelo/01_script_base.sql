/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     16/06/2022 9:36:45 p. m.                     */
/*==============================================================*/


/*==============================================================*/
/* Table: pedidos                                               */
/*==============================================================*/
create table pedidos
(
   idpedido             bigint not null auto_increment  comment '',
   idusuario            bigint  comment '',
   fecha                date not null  comment '',
   total                numeric(12,2) not null  comment '',
   primary key (idpedido)
);

/*==============================================================*/
/* Table: perfiles                                              */
/*==============================================================*/
create table perfiles
(
   idperfil             bigint not null auto_increment  comment '',
   nombre               varchar(200) not null  comment '',
   primary key (idperfil)
);

/*==============================================================*/
/* Table: productos                                             */
/*==============================================================*/
create table productos
(
   idproducto           bigint not null auto_increment  comment '',
   nombre               varchar(200) not null  comment '',
   referencia           varchar(50) not null  comment '',
   fecha                date not null  comment '',
   cantidad             int not null  comment '',
   preciocosto          numeric(12,2) not null default 0  comment '',
   precioventa          numeric(12,2) not null  comment '',
   primary key (idproducto)
);

/*==============================================================*/
/* Table: relproductospedidos                                   */
/*==============================================================*/
create table relproductospedidos
(
   idproducto           bigint not null  comment '',
   idpedido             bigint not null  comment '',
   cantidad             int not null  comment '',
   total                numeric(12,2) not null default 0  comment '',
   primary key (idproducto, idpedido)
);

/*==============================================================*/
/* Table: usuarios                                              */
/*==============================================================*/
create table usuarios
(
   idusuario            bigint not null auto_increment  comment '',
   idperfil             bigint not null  comment '',
   nombres              varchar(200) not null  comment '',
   apellidos            varchar(200) not null  comment '',
   nombreusuario        varchar(100)  comment '',
   clave                varchar(100)  comment '',
   primary key (idusuario)
);

alter table pedidos add constraint fk_pedidos_reference_usuarios foreign key (idusuario)
      references usuarios (idusuario) on delete restrict on update restrict;

alter table relproductospedidos add constraint fk_relprodu_reference_producto foreign key (idproducto)
      references productos (idproducto) on delete restrict on update cascade;

alter table relproductospedidos add constraint fk_relprodu_reference_pedidos foreign key (idpedido)
      references pedidos (idpedido) on delete restrict on update restrict;

alter table usuarios add constraint fk_usuarios_reference_perfiles foreign key (idperfil)
      references perfiles (idperfil) on delete restrict on update cascade;

