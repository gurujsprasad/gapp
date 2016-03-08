
    create table academic_record (
        id  serial not null,
        gpa float8 not null,
        gre_score float8,
        toefl_score float8,
        transcript varchar(255),
        primary key (id)
    );

    create table additional_field_values (
        id  serial not null,
        value varchar(255),
        additionalField_id int4,
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
        status_id int4,
        user_id int4,
        primary key (id)
    );

    create table applications (
        id  serial not null,
        current_status varchar(255),
        term varchar(255),
        program_id int4,
        primary key (id)
    );

    create table applications_additional_field_values (
        applications_id int4 not null,
        additionalFieldValues_id int4 not null
    );

    create table applications_application_status_update (
        applications_id int4 not null,
        statusInfo_id int4 not null
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
        academics_id int4,
        applications_id int4,
        primary key (id)
    );

    create table student_information_educational_background (
        student_information_id int4 not null,
        educationalBackground_id int4 not null
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
        primary key (id)
    );

    create table users_student_information (
        users_id int4 not null,
        studentsInfo_id int4 not null
    );

    alter table applications_additional_field_values 
        add constraint UK_bkbdvtpsgbxxxxujuy5tckcjv unique (additionalFieldValues_id);

    alter table applications_application_status_update 
        add constraint UK_c94246c81ib722w6d8c996mt unique (statusInfo_id);

    alter table student_information_educational_background 
        add constraint UK_2o4s29tv15vyeprrvbhnw8wrj unique (educationalBackground_id);

    alter table users_student_information 
        add constraint UK_d6t5ej2pkqlbm8mm1y25i8fad unique (studentsInfo_id);

    alter table additional_field_values 
        add constraint FK_gfvse1lksfrueo9xpmxg8owh2 
        foreign key (additionalField_id) 
        references additional_fields;

    alter table additional_fields 
        add constraint FK_cmnxuvbl13x9vvqhs9jgfh3dx 
        foreign key (department_id) 
        references departments;

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

    alter table applications_additional_field_values 
        add constraint FK_bkbdvtpsgbxxxxujuy5tckcjv 
        foreign key (additionalFieldValues_id) 
        references additional_field_values;

    alter table applications_additional_field_values 
        add constraint FK_mxjk3uj1ex7i168m9gvpd0urc 
        foreign key (applications_id) 
        references applications;

    alter table applications_application_status_update 
        add constraint FK_c94246c81ib722w6d8c996mt 
        foreign key (statusInfo_id) 
        references application_status_update;

    alter table applications_application_status_update 
        add constraint FK_tj4flpoahrmgefr9vceft66v 
        foreign key (applications_id) 
        references applications;

    alter table educational_background 
        add constraint FK_g3jkyldnf9x3y2yr86ku242vi 
        foreign key (studentInfo_id) 
        references student_information;

    alter table programs 
        add constraint FK_t38cee5jtiwtw07papp2rjlca 
        foreign key (department_id) 
        references departments;

    alter table student_information 
        add constraint FK_hnxu00ni933sa37ddvys8f59m 
        foreign key (academics_id) 
        references academic_record;

    alter table student_information 
        add constraint FK_2dsbv2glyvu88qvvdbhmtbrek 
        foreign key (applications_id) 
        references applications;

    alter table student_information_educational_background 
        add constraint FK_2o4s29tv15vyeprrvbhnw8wrj 
        foreign key (educationalBackground_id) 
        references educational_background;

    alter table student_information_educational_background 
        add constraint FK_6g13vsrxq0ubd9c5rxly5g95v 
        foreign key (student_information_id) 
        references student_information;

    alter table users 
        add constraint FK_krvotbtiqhudlkamvlpaqus0t 
        foreign key (role_id) 
        references user_role;

    alter table users_student_information 
        add constraint FK_d6t5ej2pkqlbm8mm1y25i8fad 
        foreign key (studentsInfo_id) 
        references student_information;

    alter table users_student_information 
        add constraint FK_ton18eqjy16q2y2ox6ujhhwb3 
        foreign key (users_id) 
        references users;

	--insert statements starts here
	   -- user_role
INSERT INTO public.user_role(role)
    VALUES ('admin');

INSERT INTO public.user_role(role)
    VALUES ('staff');

INSERT INTO public.user_role(role)
    VALUES ('student');
	
	
-- users table
INSERT INTO public.users(
            email_id, first_name, last_name, password, role_id)
    VALUES ('admin@localhost.localdomain', 'jdoe', 'admin', 'abcd', 1);

INSERT INTO public.users(
            email_id, first_name, last_name, password, role_id)
    VALUES ('staff1@localhost.localdomain', 'john', 'staff1', 'abcd', 2);


INSERT INTO public.users(
            email_id, first_name, last_name, password, role_id)
    VALUES ('staff2@localhost.localdomain', 'jack', 'staff2', 'abcd', 2);


INSERT INTO public.users(
            email_id, first_name, last_name, password, role_id)
    VALUES ('student1@localhost.localdomain', 'ram', 'student1', 'abcd', 3);


INSERT INTO public.users(
             email_id, first_name, last_name, password, role_id)
    VALUES ('student2@localhost.localdomain', 'raj', 'stduent2', 'abcd', 3);
	

-- departments table
INSERT INTO public.departments(
            name)
    VALUES ('Accounting Department');


INSERT INTO public.departments(
            name)
    VALUES ('Computer Science Department');
	
-- programs
INSERT INTO public.programs(
            program_name, department_id)
    VALUES ('MS in Accounting program', 1);


INSERT INTO public.programs(
            program_name, department_id)
    VALUES ('MS in Computer Science program', 2);

-- additionalField 
INSERT INTO public.additional_fields(
            field_type, name_of_field, required_optional, department_id)
    VALUES ('text', 'GMAT', 'required', 1);
INSERT INTO public.additional_fields(
            field_type, name_of_field, required_optional, department_id)
    VALUES ('text', 'GMAT', 'required', 1);
	
INSERT INTO public.additional_fields(
            field_type, name_of_field, required_optional, department_id)
    VALUES ('file', 'Certification Java', 'required', 2);

	
INSERT INTO public.additional_fields(
            field_type, name_of_field, required_optional, department_id)
    VALUES ('file', 'Other Certification', 'optional', 2);
		
	
-- application_status
INSERT INTO public.application_status(
            statusname)
    VALUES ('New');

INSERT INTO public.application_status(
            statusname)
    VALUES ('Pending ');

INSERT INTO public.application_status(
            statusname)
    VALUES ('Denied ');


INSERT INTO public.application_status(
            statusname)
    VALUES ('Recommend Admit ');


INSERT INTO public.application_status(
           statusname)
    VALUES ('Recommend Admit with Condition');	
    
INSERT INTO public.application_status(
           statusname)
    VALUES ('Saved');
	
	
	