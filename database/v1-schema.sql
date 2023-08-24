create or replace table Railroad
(
    id          uuid     default uuid()              not null
        primary key,
    name        text                                 null,
    history     text                                 null,
    description text                                 null,
    hqCity      text                                 null,
    serviceArea text                                 null,
    mapLink     text                                 null,
    added       datetime default current_timestamp() null,
    updated     datetime default current_timestamp() null on update current_timestamp()
);

create or replace table TimePoints
(
    id         uuid     default uuid()              not null
        primary key,
    name       text                                 null,
    type       text                                 null,
    desription text                                 null,
    arrival    timestamp                            null,
    departure  timestamp                            null,
    added      datetime default current_timestamp() null,
    updated    datetime default current_timestamp() null on update current_timestamp()
);

create or replace table Schedule
(
    id          uuid     default uuid()              not null
        primary key,
    timePointId uuid                                 null,
    name        text                                 null,
    added       datetime default current_timestamp() null,
    updated     datetime default current_timestamp() null on update current_timestamp(),
    constraint Schedule_ibfk_1
        foreign key (timePointId) references TimePoints (id),
    constraint Schedule_ibfk_2
        foreign key (timePointId) references TimePoints (id)
);

create or replace index timePointId
    on Schedule (timePointId);

create or replace table Train
(
    id               uuid     default uuid()              not null
        primary key,
    name             varchar(255)                         null,
    historical_start date                                 null,
    historical_end   date                                 null,
    description      text                                 null,
    notes            text                                 null,
    added            datetime default current_timestamp() null,
    updated          datetime default current_timestamp() null on update current_timestamp()
);

create or replace table Operator
(
    id         uuid     default uuid()              not null
        primary key,
    trainId    uuid                                 null,
    railroadId uuid                                 null,
    details    text                                 null,
    added      datetime default current_timestamp() null,
    updated    datetime default current_timestamp() null on update current_timestamp(),
    constraint Operator_ibfk_1
        foreign key (trainId) references Train (id),
    constraint Operator_ibfk_2
        foreign key (railroadId) references Railroad (id),
    constraint Operator_ibfk_3
        foreign key (trainId) references Train (id),
    constraint Operator_ibfk_4
        foreign key (railroadId) references Railroad (id)
);

create or replace index railroadId
    on Operator (railroadId);

create or replace index trainId
    on Operator (trainId);

create or replace table TrainSchedules
(
    trainId    uuid                                 null,
    scheduleId uuid                                 null,
    added      datetime default current_timestamp() null,
    updated    datetime default current_timestamp() null on update current_timestamp(),
    constraint TrainSchedules_ibfk_1
        foreign key (trainId) references Train (id),
    constraint TrainSchedules_ibfk_2
        foreign key (scheduleId) references Schedule (id),
    constraint TrainSchedules_ibfk_3
        foreign key (trainId) references Train (id),
    constraint TrainSchedules_ibfk_4
        foreign key (scheduleId) references Schedule (id)
);

create or replace index scheduleId
    on TrainSchedules (scheduleId);

create or replace index trainId
    on TrainSchedules (trainId);

create or replace table UnitType
(
    id           uuid     default uuid()              not null
        primary key,
    name         text                                 null,
    description  text                                 null,
    unitLoadType text                                 null,
    added        datetime default current_timestamp() null,
    updated      datetime default current_timestamp() null on update current_timestamp()
);

create or replace table Unit
(
    id          uuid     default uuid()              not null
        primary key,
    unitId      uuid                                 null,
    name        text                                 null,
    started     datetime                             null,
    age         int                                  null,
    mileage     int                                  null,
    `load`      text                                 null,
    ladenWeight int                                  null,
    unitWeight  int                                  null,
    added       datetime default current_timestamp() null,
    updated     datetime default current_timestamp() null on update current_timestamp(),
    constraint Unit_ibfk_1
        foreign key (unitId) references UnitType (id)
);

create or replace table Consist
(
    id      uuid     default uuid()              not null
        primary key,
    trainId uuid                                 null,
    unitId  uuid                                 null,
    details text                                 null,
    added   datetime default current_timestamp() null,
    updated datetime default current_timestamp() null on update current_timestamp(),
    constraint Consist_ibfk_1
        foreign key (trainId) references Train (id),
    constraint Consist_ibfk_2
        foreign key (trainId) references Train (id),
    constraint Consist_ibfk_3
        foreign key (unitId) references Unit (id)
);

create or replace index trainId
    on Consist (trainId);

create or replace index unitId
    on Consist (unitId);

create or replace index unitId
    on Unit (unitId);

create or replace table dtRailroadTrains
(
    trainName        varchar(255) null,
    operatorName     text         null,
    trainStarted     datetime     null,
    trainEnded       datetime     null,
    trainDescription text         null,
    trainNotes       text         null
);

create or replace table dtTrainConsist
(
    trainName        varchar(255) null,
    operatorName     text         null,
    trainStarted     datetime     null,
    trainEnded       datetime     null,
    trainDescription text         null,
    trainNotes       text         null,
    unitName         text         null,
    unitStarted      datetime     null,
    unitAge          int          null,
    unitMileage      int          null,
    unitTypeName     text         null,
    unitLadenWeight  int          null,
    unitWeight       int          null,
    unitLoad         text         null
);
