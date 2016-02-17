
    create table academic_record (
        id  serial not null,
        gpa float8 not null,
        gre_score float8,
        toefl_score float8,
        transcript varchar(255),
        applciation_id int4,
        primary key (id)
    );

    create table additional_field_values (
        id  serial not null,
        value varchar(255),
        additionalField_id int4,
        application_id int4,
        primary key (id)
    );

    create table additional_fields (
        id  serial not null,
        field_type varchar(255),
        name_of_field varchar(255),
        required_optional varchar(255),
        department_id int4,
        primary key (id)
    );

    create table application_status (
        id  serial not null,
        statusName varchar(255),
        primary key (id)
    );

    create table application_status_update (
        id  serial not null,
        comments varchar(255),
        updated_time timestamp,
        application_id int4,
        status_id int4,
        user_id int4,
        primary key (id)
    );

    create table applications (
        id  serial not null,
        term varchar(255),
        program_id int4,
        studentInfomration_id int4,
        primary key (id)
    );

    create table departments (
        id  serial not null,
        name varchar(255),
        primary key (id)
    );

    create table educational_background (
        id  serial not null,
        college_name varchar(255),
        degree varchar(255),
        end_year timestamp,
        major varchar(255),
        start_year timestamp,
        studentInfo_id int4,
        primary key (id)
    );

    create table programs (
        id  serial not null,
        program_name varchar(255),
        department_id int4,
        primary key (id)
    );

    create table student_information (
        id  serial not null,
        Citizenship varchar(255),
        cin varchar(255),
        dob timestamp,
        email varchar(255),
        first_name varchar(255),
        gender varchar(255),
        international_student int4,
        last_name varchar(255),
        phone_number varchar(255),
        user_id int4,
        primary key (id)
    );

    create table user_role (
        id  serial not null,
        role varchar(255),
        primary key (id)
    );

    create table users (
        id  serial not null,
        email_id varchar(255),
        first_name varchar(255),
        last_name varchar(255),
        password varchar(255),
        role_id int4,
        studentsInfo_id int4,
        primary key (id)
    );

    alter table academic_record 
        add constraint FK_o1sqq4fhudi8h13i0k7sfs6gs 
        foreign key (applciation_id) 
        references applications;

    alter table additional_field_values 
        add constraint FK_gfvse1lksfrueo9xpmxg8owh2 
        foreign key (additionalField_id) 
        references additional_fields;

    alter table additional_field_values 
        add constraint FK_4d5618c8bnbxon7afdruhmhcm 
        foreign key (application_id) 
        references applications;

    alter table additional_fields 
        add constraint FK_cmnxuvbl13x9vvqhs9jgfh3dx 
        foreign key (department_id) 
        references departments;

    alter table application_status_update 
        add constraint FK_9ro2aqh684000hkp80d3pqt2r 
        foreign key (application_id) 
        references applications;

    alter table application_status_update 
        add constraint FK_d6wiqekkd0n2t0pbgwksyyhvy 
        foreign key (status_id) 
        references application_status;

    alter table application_status_update 
        add constraint FK_pxh9ypdst90a1jtxjldyi9j2m 
        foreign key (user_id) 
        references users;

    alter table applications 
        add constraint FK_fvv8mt4q3l0jlgem0374rwfb5 
        foreign key (program_id) 
        references programs;

    alter table applications 
        add constraint FK_qb0wk4q26toeopnt6b6lbbk8m 
        foreign key (studentInfomration_id) 
        references student_information;

    alter table educational_background 
        add constraint FK_g3jkyldnf9x3y2yr86ku242vi 
        foreign key (studentInfo_id) 
        references student_information;

    alter table programs 
        add constraint FK_t38cee5jtiwtw07papp2rjlca 
        foreign key (department_id) 
        references departments;

    alter table student_information 
        add constraint FK_smqyrpnty4toe0ogtlk85m3ec 
        foreign key (user_id) 
        references users;

    alter table users 
        add constraint FK_krvotbtiqhudlkamvlpaqus0t 
        foreign key (role_id) 
        references user_role;

    alter table users 
        add constraint FK_n998omgaq1wnmy1e6ch7u2d5u 
        foreign key (studentsInfo_id) 
        references student_information;
