create table Users
(id         integer      not null,
 name       varchar(40),
 nickname   varchar(30)  not null,
 biografia  varchar(160),
 email      varchar(50)  not null,
 primary key(id),
 unique(nickname)); -- NICKNAME É UNICO??

insert into Users values (1, 'Matheus Azambuja', 'matheusazambuja', 'Studying Science Computer at UFRGS', 'matheusazambuja35@gmail.com');
insert into Users values (2, 'Karin Becker', 'karinbecker', null, 'kbecker@inf.br');
insert into Users values (3, null, 'nicollefavero', null, 'nfavero@inf.br');
insert into Users values (4, 'Netflix, Inc.', 'Netflix', 'Netflix Open Source Platform', 'netflixoss@netflix.com');
insert into Users values (5, 'Google', 'google', 'Google ❤️ Open Source', 'opensource@google.com');
insert into Users values (6, 'João da Silva', 'jsilva', null, 'jsilva35@gmail.com');
select * from Users
-- drop table Users

create table Contributors
(id         integer      not null,
 idUser     integer      not null,
 primary key(id),
 foreign key(idUser) references Users,
 unique(idUser));

insert into Contributors values (1, 1);
insert into Contributors values (2, 1);
insert into Contributors values (3, 2);
insert into Contributors values (4, 2);
insert into Contributors values (5, 2);
insert into Contributors values (6, 2);
select * from Contributors
drop table Contributors


create table Organizations
(id         integer      not null,
 idUser     integer      not null,
 primary key(id),
 foreign key(idUser) references Users);

create table Members
(idContrib  integer not null,
 idOrg      integer not null,
 primary key(idContrib, idOrg),
 foreign key(idContrib) references Contributors,
 foreign key(idOrg) references Organizations);

create table Follows
(idFollower integer      not null,
 idFollowed integer      not null,
 date       Date         not null,
 primary key(idFollowed, idFollower),
 foreign key(idFollowed) references Contributors,
 foreign key(idFollower) references Contributors);

create table Repositories
(idRepo       integer      not null,
 idUser       integer      not null,
 name         varchar(60)  not null,
 creationDate Date         not null,
 primary key(id, idUser),
 foreign key(idUser) references Users,
 unique(name));

create table Stars
(idContrib    integer not null,
 idRepo       integer not null,
 date         Date    not null,
 primary key(idContrib, idRepo),
 foreign key(idContrib) references Contributors,
 foreign key(idRepo) references Repositories);

-- LICENSES É ATRIB-MULTVALOR?? OU N-M TALVEZ??
-- create table Licenses
-- (cod      integer     not null,
--  idRepo   integer     not null,
--  type     varchar(60) not null,
--  primary key(cod, idRepo),
--  foreign key(idRpository) references Repositories);

create table Issues
(number       integer       not null,
 description  varchar(2500) not null,
 date         Date          not null,
 idRepo       integer       not null,
 idContrib    integer       not null,
 primary key(number, idRepo),
 foreign key(idRepo) references Repositories,
 foreign key(idContrib) references Contributors);

-- COMENTAR SOBRE PRECISAR DE DESCRIPTION EM COMMENT
-- create table Comment
-- (idContrib   integer not null,
--  numIssue    integer not null,
--  date        Date    not null,
--  description integer nontnull,
--  primary key(idContrib, numIssue, date),
--  foreign key(idContrib) references Contributors,
--  foreign key(numIssue) references Issues);

create table Topics
(cod     integer     not null,
 name    varchar(60) not null,
 primary key(cod),
 unique(name));

create table Category
(idRepo     integer not null,
 codTopic   integer not null,
 primary key(idRepo, codTopic),
 foreign key(idRepo) references Repositories,
 foreign key(codTopic) references Topics);

create table Items
(id         integer      not null,
 name       varchar(100) not null,
 idRepo     integer      not null,
 primary key(id),
 foreign key(idRepo) references Repositories)

create table Folders
(id         integer not null,
 idItem     integer not null,
 primary key(id),
 foreign key(idItem) references Items);

create table FullWith
(idItem   integer not null,
 idFolder integer not null,
 primary key(idItem),
 foreign key(idItem) references Items,
 foreign key(idFolder) references Folders);

create table Files
(id          integer    not null,
 idItem      integer    not null,
 termination varchar(5) not null,
 primary key(id),
 foreign key(idItem) references Items);

create table Languages
(cod    integer not null,
 name   varchar(25),
 primary key(cod));

create table Implementations
(idFile        integer not null,
 codLanguage   integer not null,
 primary key(idFile),
 foreign key(idFile) references Files,
 foreign key(codLanguage) references Languages);

-- create table Commits()